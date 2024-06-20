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
keymap.set("n", "<M-.>", "<c-w>5<")
keymap.set("n", "<M-,>", "<c-w>5>")
keymap.set("n", "<M-t>", "<C-W>+")
keymap.set("n", "<M-s>", "<C-W>-")

-- move a blocks of text up/down with K/J in visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- center cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz") -- center next-searching 
keymap.set("n", "N", "nzz")


-- paste our contents without replace what’s in the register
keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste without updating register" })

-- keep indenting or outdenting without needing to reselect
keymap.set("v", "<", "<gv", { desc = "Stay in visual mode during outdent" })
keymap.set("v", ">", ">gv", { desc = "Stay in visual mode during indent" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
keymap.set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return vim.keycode "<CR>"
  end
end, { expr = true })

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<leader>te", "<c-\\><c-n>") -- terminal exit

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>st", function() -- start terminal
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)





