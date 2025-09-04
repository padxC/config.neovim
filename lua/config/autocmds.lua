-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd({ "TextYankPost" }, { -- Highlight when yanking (copying) text
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 80, visual = true })
	end,
})

vim.api.nvim_create_autocmd({ "TermOpen" }, { -- set local settings for terminal buffers
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		local set = vim.opt_local
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, { -- disable comment when insert next line
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})
