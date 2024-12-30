local M = {
	"stevearc/dressing.nvim",
	event = "VeryLazy", -- a little aesthetic GUI
}

function M.config()
	require("dressing").setup()
end

return M
