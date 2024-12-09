-- others
local M = {
	{ "christoomey/vim-tmux-navigator", event = "VimEnter" },
	{ "aserowy/tmux.nvim", event = "VeryLazy" },
}

function M.config()
	require("vim-tmux-navigator").setup({
		--vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true }),
		--vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true }),
		--vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true }),
		--vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true }),
	})

	require("tmux").setup({
		resize = {
			enable_default_keybindings = false,
		},
	})
end

return M
