local M = { -- Ctrl-u && Ctrl-d to control preview
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	-- key mappings for Telescope

	local mappings = {
		{ key = "<leader>sb", cmd = "buffers", desc = "[S]earch [B]uffers" },
		{ key = "<leader>sf", cmd = "find_files", desc = "[S]earch [F]iles" }, -- in current Directory
		{ key = "<leader>sr", cmd = "oldfiles", desc = "[S]earch [R]ecent Files" },
		{ key = "<leader>sh", cmd = "help_tags", desc = "[S]earch Helps" },
		{ key = "<leader>sg", cmd = "live_grep", desc = "[S]earch Words" },
		{ key = "<leader>sw", cmd = "grep_string", desc = "[S]earch [W]ords " }, -- in current File
	}

	for _, map in ipairs(mappings) do
		vim.api.nvim_set_keymap("n", map.key, "<cmd>Telescope " .. map.cmd .. "<cr>", {
			noremap = true,
			silent = true,
			desc = map.desc,
		})
	end

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
