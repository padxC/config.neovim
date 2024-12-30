local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
}

-- setup keymap for the "BUFFER" where lsp is active
local function lsp_keymaps(bufnr)
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

	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr })
	end
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }), { bufnr })
end

function M.capabilities() -- turning on snippet support
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

--]]
local border = {
	{ "╔", "FloatBorder" },
	{ "═", "FloatBorder" },
	{ "☘︎", "FloatBorder" },
	{ "║", "FloatBorder" },
	{ "╝", "FloatBorder" },
	{ "═", "FloatBorder" },
	{ "╚", "FloatBorder" },
	{ "║", "FloatBorder" },
}

function M.config()
	local lspconfig = require("lspconfig")

	--  this is for change border of hover
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
	require("lspconfig.ui.windows").default_options.border = border

	vim.diagnostic.config({
		virtual_text = false,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = border,
			header = "",
			prefix = "",
		},
	})

	-- list server for specific setup
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"emmet_ls",
		"emmet_language_server",
		"somesass_ls", -- scss
		"tailwindcss",
		--"eslint",
		--"tsserver",
		--"pyright",
		--"bashls",
		--"jsonls",
		--"yamlls",
		--"clangd",
	}
	-- loop through severs lsp (create lspsettings dir for each language)
	for _, server in ipairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.capabilities(),
		}
		-- extend on lspsettings directory
		local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
		if require_ok then
			--use the settings of lspsettings files
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		-- neodev for easy work with config files
		if server == "lua_ls" then
			require("neodev").setup()
		end

		-- add specific for each server
		lspconfig[server].setup({ opts })
	end
end

return M
