-- spacebar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---===---
local keymap = vim.keymap

-- navigate quickfix list
keymap.set("n", "<C-n>", "<cmd>cnext<CR>")
keymap.set("n", "<C-p>", "<cmd>cprevious<CR>")

-- navigate window keybinds
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
keymap.set("n", "N", "Nzz")

-- not affecting registers && jumplist
keymap.set("n", "x", '"_x')
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without updating register" })
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without updating register" })
keymap.set("n", "}", '<cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>', { silent = true })
keymap.set("n", "{", '<cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>', { silent = true })

-- keep indenting or outdenting without needing to reselect
keymap.set("v", "<", "<gv", { desc = "Stay in visual mode during outdent" })
keymap.set("v", ">", ">gv", { desc = "Stay in visual mode during indent" })

-- increment/decrement
-- keymap.set({ "n", "v" }, "+", "<C-a>")
-- keymap.set({ "n", "v" }, "-", "<C-x>")

-- ctrl + backspace deletion +555% speed
keymap.set("i", "<C-h>", "<C-w>")

--
