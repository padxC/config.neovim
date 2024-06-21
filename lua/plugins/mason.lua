
local M = {
    "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config() 
  require("mason").setup({
    ui = {
    border = "rounded",
    icons = true,
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "pyright",
      "bashls",
      "jsonls",
      --"clangd",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, 
  })
end

return M
