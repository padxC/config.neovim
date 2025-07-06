local M = {
	"mbbill/undotree",
	event = "VeryLazy", -- Load on first undo operation
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
	},
}

function M.config() end

return M
