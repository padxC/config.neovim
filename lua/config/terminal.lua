local keymap = vim.keymap

-- Function to open the fixed size terminal at the bottom
local cp_setup = 0
local function open_terminal()
	vim.cmd.new() -- Open a new split
	vim.cmd.wincmd("J") -- Move it to the bottom
	vim.api.nvim_win_set_height(0, 12) -- Set fixed height
	vim.wo.winfixheight = true -- Prevent resizing
	vim.cmd.term() -- Open terminal

	cp_setup = vim.bo.channel -- Store terminal channel ID
end

--THIS IS SETUP FOR CP
-- Keybinding to open terminal and compile/run the current file
local function validate_setup()
	local file_extension = vim.fn.expand("%:e")

	if file_extension ~= "cpp" then
		vim.notify("Not a C++ File ...", vim.log.levels.INFO)
		return false
	end

	if cp_setup == 0 then
		vim.notify("Terminal is not Open ...", vim.log.levels.INFO)
		return false
	end

	return true
end

keymap.set("n", "<leader>0", function()
	if not validate_setup() then
		return
	end

	local filename = vim.fn.expand("%:t:r")
	local compile_cmd = string.format(
		"clear && echo '═════════════════════════════════\nInput:' && cat input.txt | sed 's/^/ |  /' && "
			.. "echo '\nOutput:' && g++ %s.cpp -std=c++17 -Wall -Wextra -Wshadow -O2 -o program && "
			.. "./program < input.txt | sed 's/^/ |  /' && echo '═════════════════════════════════\nDebug:' && "
			.. "cat error.txt && echo '\n'",
		filename
	)

	vim.fn.chansend(cp_setup, compile_cmd .. "\r\n")
end)

keymap.set("n", "<leader>9", function()
	if not validate_setup() then
		return
	end

	local filename = vim.fn.expand("%:t:r")
	local compile_cmd = string.format(
		" clear && g++ %s.cpp -std=c++17 -Wall -Wextra -Wshadow -O2 -o program && "
			.. "echo '═════════════════════════════════\nInput:' &&"
			.. "./program > output.txt && "
			.. "echo '\nOutput:' && cat output.txt | sed 's/^/ |  /' && "
			.. "echo '═════════════════════════════════\nDebug:' && "
			.. "cat error.txt && echo '\n'",
		filename
	)

	vim.fn.chansend(cp_setup, compile_cmd .. "\r\n")
end)

-- Easily hit escape in terminal mode
keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- Escape from terminal

-- Keybinding to open terminal (separate from the compilation command)
keymap.set("n", "<leader>Ts", function()
	-- Open terminal without sending any command
	open_terminal()
end)
