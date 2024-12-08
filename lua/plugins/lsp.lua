local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
}

local function lsp_keymaps(bufnr) -- setup keymap for the "BUFFER" where lsp is active
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- diagnostic for line
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
end

function M.common_capabilities() -- turning on snippet support
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

--]]

function M.config()
	local lspconfig = require("lspconfig")

	--  GUI stuffs
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	require("lspconfig.ui.windows").default_options.border = "rounded"

	vim.diagnostic.config({
		virtual_text = false,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			header = "",
			prefix = "",
		},
	})

	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"emmet_ls",
		--"eslint",
		--"tsserver",
		--"pyright",
		--"bashls",
		--"jsonls",
		--"yamlls",
		--"clangd",
	}

	for _, server in ipairs(servers) do -- loop through severs lsp (create lspsettings dir for each language)
		-- extend
		local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		-- neodev for easy work with config files
		if server == "lua_ls" then
			require("neodev").setup({})
		end

		-- add specific for each server

		lspconfig[server].setup({
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		})
	end
end

return M
