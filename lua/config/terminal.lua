local keymap = vim.keymap

-- Terminal management
local cp = {
	term_buf = nil,
	term_win = nil,
	term_chan = nil,
	width = 60, -- Default terminal width
	height = 12, -- Default terminal height
}

-- Open or focus terminal
local function toggle_terminal()
	if cp.term_win and vim.api.nvim_win_is_valid(cp.term_win) then
		-- Terminal exists, focus it
		vim.api.nvim_set_current_win(cp.term_win)
	else
		-- Create new terminal
		local current_win = vim.api.nvim_get_current_win()
		vim.cmd.new()
		cp.term_win = vim.api.nvim_get_current_win()
		cp.term_buf = vim.api.nvim_get_current_buf()

		-- Position and size
		vim.cmd.wincmd("L") -- Move to right side
		vim.api.nvim_win_set_width(cp.term_win, cp.width)
		vim.wo[cp.term_win].winfixwidth = true -- Prevent resizing

		-- Open terminal
		vim.cmd.term()
		cp.term_chan = vim.b.terminal_job_id

		-- Return to original window
		vim.api.nvim_set_current_win(current_win)
	end
end

-- Validate file and terminal for CP operations
local function validate_file()
	if vim.fn.expand("%:e") ~= "cpp" then
		vim.notify("Not a C++ file", vim.log.levels.WARN)
		return false
	end

	if not cp.term_chan or not vim.api.nvim_buf_is_valid(cp.term_buf) then
		vim.notify("Terminal not ready", vim.log.levels.WARN)
		return false
	end

	return true
end

-- Execute command in terminal with formatted output
local function run_cmd(flags, input_file, output_file)
	if not validate_file() then
		return
	end

	local filename = vim.fn.expand("%:t:r")
	local input_part = input_file and string.format("cat %s | sed 's/^/ |  /'", input_file) or ""
	local output_part = output_file and string.format(" > %s", output_file) or ""
	local display_part = output_file and string.format("cat %s | sed 's/^/ |  /'", output_file) or "./program"

	local cmd = string.format(
		"clear && echo '═════════════════════════════════\nInput:' && %s && "
			.. "echo '\nOutput:' && g++ %s.cpp -std=c++17 %s -o program && "
			.. "./program %s %s | sed 's/^/ |  /' && "
			.. "echo '\n═════════════════════════════════\n'",
		input_part,
		filename,
		flags,
		input_file and "< " .. input_file or "",
		output_part
	)

	vim.fn.chansend(cp.term_chan, cmd .. "\r\n")
end

keymap.set("n", "<leader>Ts", toggle_terminal, { desc = "Toggle terminal" })
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("n", "<leader>0", function()
	run_cmd("-O2 -Wall -Wextra -Wshadow -Wno-unused-result -Wduplicated-cond", "input.txt")
end, { desc = "Compile & run (fast)" })

keymap.set("n", "<leader>9", function()
	run_cmd(
		"-O2 -Wall -Wextra -Wformat=2 -Wshadow -Wno-unused-result "
			.. "-Wduplicated-cond -Wlogical-op -Wconversion -ggdb3 "
			.. "-D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC "
			.. "-fsanitize=undefined,address -fstack-protector-all",
		"input.txt"
	)
end, { desc = "Compile & run (debug)" })
