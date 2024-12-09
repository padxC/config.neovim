local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
}

function M.config()
	local lualine = require("lualine")

	-- setting up lualine
	lualine.setup({
		options = {
			icons_enabled = true,
			--check more them https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
			theme = "gruvbox_dark",
			--"gruvbox-material",
			--"horizon",

			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icons_enabled = true,
					icon = "",
				},
			},
			lualine_b = {
				"branch",
			},
			lualine_c = {
				{
					function()
						--return ""
						return "%="
					end,
				},
				{
					"filetype",
					icon_only = true,
				},
				{
					"filename",
					symbols = {
						modified = "",
						readonly = "",
						unnamed = "[No Name]",
						newfile = "",
					},
				},
			},
			lualine_x = { "encoding" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end

return M
