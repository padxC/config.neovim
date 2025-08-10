local M = {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

function M.config()
	require("mason").setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",

			"cssls",
			"html",
			"tailwindcss",
			"emmet_ls",
			"emmet_language_server",

			"marksman",
			--"pyright",
			--"bashls",
			--"clangd",
		},
		automatic_enable = false,
		automatic_installation = {
			exclude = {}, -- List of servers to exclude from auto-install
		},
	})

	require("mason-tool-installer").setup({
		ensure_installed = {
			"prettier",
			"stylua",

			-- "isort", -- python formatter
			-- "black",
			-- "pylint", -- linters

			"rustywind",
			"clangd",
			"denols",
		},
		auto_update = true,
		run_on_start = true,
		start_delay = 3000,
		debounce_hours = 12,
	})
end

return M
