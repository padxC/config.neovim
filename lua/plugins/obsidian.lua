local M = {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = "VeryLazy",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

function M.config()
	-- Replace the deprecated vim.tbl_islist with vim.islist
	vim.tbl_islist = vim.islist

	require("obsidian").setup({
		workspaces = {
			{
				name = "_Writings",
				path = "/mnt/c/dev/writing-archive/",
			},
		},
		new_notes_location = "current_dir",
		disable_frontmatter = true,
		templates = {
			folder = "templates",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	})

	-- Setup key mappings
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>on", "<cmd>ObsidianNew<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>op", "<cmd>ObsidianPasteImg<CR>", opts)
end

return M
