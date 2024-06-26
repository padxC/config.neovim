
local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
      "folke/neodev.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
  }
}

local function lsp_keymaps(bufnr) -- setup keymap for the "BUFFER" where lsp is active
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr) -- when the lsp is attached
  lsp_keymaps(bufnr)
  -- giving some hints 
  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { only_current_line = false })
  end
end
---]]]

function M.common_capabilities() -- turning on snippet support
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

function M.config()
  -- LSP key mappings
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap
  keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>", opts)
  keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
  keymap("n", "<leader>lh", "<cmd>lua require('plugins.lsp').toggle_inlay_hints()<cr>", opts)
  keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
  keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
  keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap("v", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

  local lspconfig = require "lspconfig"

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "eslint",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    --"clangd",
  }

  local default_diagnostic_config = {
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
 }

  vim.diagnostic.config(default_diagnostic_config)

  -- rounded GUI stuffs
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  -- loop through severs lsp (create lspsettings dir for each language)
  for _, server in pairs(servers) do 
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    -- neodev for easy work with config files
    if server == "lua_ls" then
      require("neodev").setup {}
    end

    lspconfig[server].setup(opts)

  end
end

return M
