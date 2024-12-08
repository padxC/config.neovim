-- spacebar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---===---
local keymap = vim.keymap

-- tabs
keymap.set("n", "<left>", "gT")
keymap.set("n", "<right>", "gt")

-- basic movement keybinds
keymap.set("n", "<c-j>", "<c-w><c-j>")
keymap.set("n", "<c-k>", "<c-w><c-k>")
keymap.set("n", "<c-l>", "<c-w><c-l>")
keymap.set("n", "<c-h>", "<c-w><c-h>")

-- control size
--keymap.set("n", "<M->>", "<c-w>5<")
--keymap.set("n", "<M-<>", "<c-w>5>")
--keymap.set("n", "<M-+>", "<C-W>+")
--keymap.set("n", "<M-->", "<C-W>-")

-- using aserowy/tmux.nvim for resizing
keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

-- move a blocks of text up/down with K/J in visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- center cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz") -- center next-searching
keymap.set("n", "N", "nzz")

-- paste out && delete contents without replace what’s in the register
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without updating register" })
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- keep indenting or outdenting without needing to reselect
keymap.set("v", "<", "<gv", { desc = "Stay in visual mode during outdent" })
keymap.set("v", ">", ">gv", { desc = "Stay in visual mode during indent" })

-- ctrl + backspace deletion +555% speed
keymap.set("i", "<C-h>", "<C-w>")

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<leader>te", "<c-\\><c-n>") -- terminal exit

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>to", function() -- terminal open
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)
