local M = {
	"m4xshen/hardtime.nvim",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
}

function M.config()
	require("hardtime").setup({})
end

return M
