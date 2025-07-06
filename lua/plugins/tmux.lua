-- others
local M = {
	{ "christoomey/vim-tmux-navigator", event = "VimEnter" },
	{ "aserowy/tmux.nvim", event = "VeryLazy" },
}

function M.config()
	require("vim-tmux-navigator").setup({})

	require("tmux").setup({
		resize = {
			enable_default_keybindings = false,
		},
	})
end

return M
