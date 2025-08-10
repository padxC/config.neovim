--
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 80, visual = true })
	end,
})

-- set local settings for terminal buffers
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		local set = vim.opt_local
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
	end,
})

-- disable comment when insert next line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})

-- auto wrap && spell
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- low-level languages
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "asm", "s", "S" }, -- Adjust file extensions as needed
	callback = function()
		-- Set tab width (number of spaces per tab)
		vim.bo.tabstop = 4 -- Use 4 spaces for a tab
		vim.bo.shiftwidth = 4 -- Indentation level is 4 spaces
		vim.bo.softtabstop = 4 -- Number of spaces to insert when hitting Tab
	end,
})
