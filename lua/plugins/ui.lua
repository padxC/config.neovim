local M = {
	{ "stevearc/dressing.nvim", event = "VeryLazy" }, -- a little aesthetic GUI
	{ "j-hui/fidget.nvim" }, -- lsp status, progress
}

function M.config()
	require("dressing").setup({})
	require("fidget").setup({})
end

return M
