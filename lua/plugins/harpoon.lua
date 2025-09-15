local M = {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true }

	-- Change keybindings
	keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts) -- [H]apoon [A]dd
	keymap("n", "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts) -- [H]appon [L]ist

	for idx = 1, 5 do -- Set <leader>1 to <leader>5 for selecting files
		keymap(
			"n",
			string.format("<leader>%d", idx),
			string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<cr>", idx),
			opts
		)
	end
end

return M
