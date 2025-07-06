--M for module
local M = {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },

			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier", "rustywind" },
			typescriptreact = { "prettier", "rustywind" },

			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			--markdown = { "prettier" },
			--graphql = { "prettier" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 2500,
		},
	})
end

return M
