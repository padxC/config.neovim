---===---
local opt = vim.opt

-- scrolling & appearance
opt.relativenumber = true -- relative line numbers
opt.number = true -- enable line numbers
opt.winborder = "rounded"
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.signcolumn = "yes:1"
opt.termguicolors = true -- enable terminal colors

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

-- search & settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- include mixed case
opt.inccommand = "split" -- open preview when doing substitute

-- behaviour
opt.mouse = "a" -- allow mouse
opt.swapfile = false -- creates a swapfile
opt.undofile = true -- enable persistent undo/undo-tree
opt.clipboard = "unnamedplus" -- sync clipboard
opt.splitbelow = true
opt.showmode = false

-- completion
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")
opt.updatetime = 200 -- faster completion (4000ms default)

-- markdown files
opt.conceallevel = 2

opt.list = true
opt.listchars:append({
	tab = " │", -- alternative ▸
  lead = "￮",
	trail = "￮",
	multispace = "￮", --noto fonts
	nbsp = "‿",
})

opt.guicursor = {
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar (25% width)
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar (20% height)
	"o:hor50", -- Operator-pending: horizontal bar (50% height)
	"a:blinkwait700-blinkoff400-blinkon250", -- Blink settings
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block with different blink
}

opt.fillchars = { -- aesthetic appearance
	horiz = "━", -- line when split windows
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
	stl = " ",
	stlnc = " ",
	eob = " ", -- remove the ~ on left side --'
	--diff = "┃", --╱ ⣿ ░ ─
	--msgsep = "‾",
  foldopen = "▾",
  foldclose = "▸",
  fold = " ",
  foldsep = " ",
}
