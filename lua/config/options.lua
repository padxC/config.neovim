---===---
local opt = vim.opt

-- scrolling & appearance
opt.number = true -- enable line numbers
opt.relativenumber = true -- relative line numbers
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.signcolumn = "yes"
--opt.colorcolumn = "80"
--opt.guicursor = "n-v-i-c:block-Cursor"
--opt.cursorline = true
opt.termguicolors = true -- enable terminal colors

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false -- let the line go, stop initializing new line when get out of view
opt.breakindent = true

-- search & settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- include mixed case
opt.incsearch = true
opt.inccommand = "split" -- open preview when doing substitute

-- behaviour
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- sync clipboard

-- completion
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")

-- split windows
opt.splitright = true -- split vertical window >
opt.splitbelow = true

-- for obsidian, markdown files
opt.conceallevel = 2
