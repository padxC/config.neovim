--M for module
local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = false, -- immediately setup
	priority = 1000,
}

function M.config()
	require("gruvbox").setup({
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = false,
			emphasis = false,
			comments = true,
			operators = false,
			folds = false,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = true,
	})
	vim.o.background = "dark"
	vim.cmd("colorscheme gruvbox")
end

return M
