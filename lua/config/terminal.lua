--
local keymap = vim.keymap

-- Easily hit escape in terminal mode
keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- Escape from terminal

-- Function to open the fixed size terminal at the bottom
local function open_terminal()
	vim.cmd.new() -- Open a new split
	vim.cmd.wincmd("J") -- Move it to the bottom
	vim.api.nvim_win_set_height(0, 12) -- Set fixed height
	vim.wo.winfixheight = true -- Prevent resizing
	vim.cmd.term() -- Open terminal
end

-- Function to send commands to the terminal
local function send_to_terminal(cmd)
	if vim.b.cp_setup == nil then
		-- If terminal isn't open, open it first
		open_terminal()
		vim.b.cp_setup = vim.bo.channel -- Store terminal channel ID
	end

	-- Wait for the terminal to be stable (e.g., 500ms)
	vim.loop.new_timer():start(
		500,
		0,
		vim.schedule_wrap(function()
			-- Send the command to the terminal after the delay
			vim.fn.chansend(vim.b.cp_setup, cmd .. "\r\n")
		end)
	)
end

--THIS IS SETUP FOR CP
-- Keybinding to open terminal and compile/run the current file
keymap.set("n", "<leader>0", function()
	-- Get the current file's extension
	local file_extension = vim.fn.expand("%:e")

	-- Only proceed if the file is a C++ source file
	if file_extension == "cpp" then
		-- Get the current file's base name without extension
		local filename = vim.fn.expand("%:t:r") -- e.g., "solution" for "solution.cpp"

		-- Construct the compilation command
		local compile_cmd = string.format(
			"clear && echo '__________________________________\nInput:' && cat input.txt | sed 's/^/ |  /' && echo '\nDebug:' && cat error.txt && echo '\nOutput:' && g++ %s.cpp -std=c++17 -Wall -Wextra -Wshadow -O2 -o program && ./program < input.txt | sed 's/^/ |  /' && echo '__________________________________\n' ",
			filename
		)
		-- Send the compile/run command to the terminal
		send_to_terminal(compile_cmd)
	else
		print("Not a C++ file!!!")
	end
end)

-- Keybinding to open terminal (separate from the compilation command)
vim.keymap.set("n", "<leader>T", function()
	-- Open terminal without sending any command
	open_terminal()
end)
