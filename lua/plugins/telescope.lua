local M = { -- Ctrl-u && Ctrl-d to control preview
	"nvim-telescope/telescope.nvim",
  tag = '0.1.8',
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local builtin = require('telescope.builtin')
  local keymap = vim.keymap
  keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
  keymap.set('n', '<leader>sr', builtin.oldfiles, { desc = 'Telescope search word' })
  keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
  keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
  keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })

	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			path_display = { "smart" },
			color_devicons = true,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},
			mappings = {
				i = {
					["<Esc>"] = actions.close,
					["<C-Space>"] = require("telescope.actions.layout").toggle_preview,
				},
				n = {
					["<Esc>"] = actions.close,
				},
			},
		},
		pickers = {
			find_files = {
        previewer = false,
        hidden = true,
			},
			buffers = {
				previewer = false,
			},
		},
	})
end

return M
