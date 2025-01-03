local M = {
	"williamboman/mason.nvim",
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
			"html", --"tailwindcss",
			"emmet_ls",
			"emmet_language_server",
			"somesass_ls", -- scss
			"tailwindcss",
			--"pyright",
			--"bashls",
			"clangd",
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true,
	})

	require("mason-tool-installer").setup({
		auto_update = true,
		run_on_start = true,
		start_delay = 3000,
		debounce_hours = 12,
		ensure_installed = {
			"prettier",
			"stylua", -- lua formatter
			--"eslint_d",
			"rustywind", -- tailwind formatter
		},
	})
end

return M
