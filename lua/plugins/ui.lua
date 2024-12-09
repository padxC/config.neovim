local M = {
	{ "stevearc/dressing.nvim", event = "VeryLazy" }, -- a little aesthetic GUI
	{ "j-hui/fidget.nvim", tag = "legacy", event = { "BufEnter" } }, -- lsp status, progress
}

function M.config()
	require("dressing").setup({})
	require("fidget").setup({
		text = {
			spinner = "arc", -- animation shown when tasks are ongoing
			done = "✔", -- character shown when all tasks are complete
			commenced = "Started", -- message shown when task starts
			completed = "Completed", -- message shown when task completes
		},
		align = {
			bottom = true, -- align fidgets along bottom edge of buffer
			right = true, -- align fidgets along right edge of buffer
		},
		timer = {
			spinner_rate = 125, -- frame rate of spinner animation, in ms
			fidget_decay = 2000, -- how long to keep around empty fidget, in ms
			task_decay = 1000, -- how long to keep around completed task, in ms
		},
		window = {
			relative = "win", -- where to anchor, either "win" or "editor"
			blend = 0, -- &winblend for the window
			zindex = nil, -- the zindex value for the window
			border = "none", -- style of border for the fidget window
		},
		fmt = {
			leftpad = true, -- right-justify text in fidget box
			stack_upwards = false, -- list of tasks grows upwards
			max_width = 0, -- maximum width of the fidget box
		},
	})
end

return M
