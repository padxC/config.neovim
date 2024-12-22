local M = { -- Ctrl-u && Ctrl-d to control preview
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	-- key mappings for Telescope
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sb",
		"<cmd>Telescope buffers<cr>",
		{ noremap = true, silent = true, desc = "[S]earch Buffers" }
	)
	vim.api.nvim_set_keymap( -- in current Directory
		"n",
		"<leader>sf",
		"<cmd>Telescope find_files<cr>",
		{ noremap = true, silent = true, desc = "[S]earch Files" }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sg",
		"<cmd>Telescope live_grep<cr>",
		{ noremap = true, silent = true, desc = "[S]earch Words" }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sh",
		"<cmd>Telescope help_tags<cr>",
		{ noremap = true, silent = true, desc = "[S]earch Helps" }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sw",
		"<cmd>Telescope grep_string<cr>",
		{ noremap = true, silent = true, desc = "[S]earch [W]ords in Files" }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sr",
		"<cmd>Telescope oldfiles<cr>",
		{ noremap = true, silent = true, desc = "[S]earch [R]ecent Files" }
	)

	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			selection_strategy = "reset",
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
					["<C-c>"] = actions.close,
					["<C-Space>"] = require("telescope.actions.layout").toggle_preview,
				},
				n = {
					["<Esc>"] = actions.close,
					["<C-p>"] = actions.move_selection_previous,
					["<C-n>"] = actions.move_selection_next,
				},
			},
		},
		pickers = {
			find_files = {
				previewer = false,
			},
			buffers = {
				previewer = false,
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	})
end

return M
