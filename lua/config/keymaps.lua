-- spacebar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---===---
local keymap = vim.keymap

-- navigate window keybinds
keymap.set("n", "<c-j>", "<c-w><c-j>")
keymap.set("n", "<c-k>", "<c-w><c-k>")
keymap.set("n", "<c-l>", "<c-w><c-l>")
keymap.set("n", "<c-h>", "<c-w><c-h>")

-- center cursor
keymap.set("n", "n", "nzz") -- center next-searching
keymap.set("n", "N", "Nzz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- not affecting registers && jumplist
keymap.set("n", "x", '"_x')
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without updating register" })
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without updating register" })

-- keep indenting or outdenting without needing to reselect
keymap.set("v", "<", "<gv", { desc = "Stay in visual mode during outdent" })
keymap.set("v", ">", ">gv", { desc = "Stay in visual mode during indent" })
-- move a blocks of text up/down with K/J in visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- ctrl + backspace deletion
keymap.set("i", "<C-h>", "<C-w>")

-- enter to :nohl
keymap.set("n", "<CR>", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.v.hlsearch == 1 then
		vim.cmd.nohl()
		return ""
	else
		return vim.keycode("<CR>")
	end
end, { expr = true })

