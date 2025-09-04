local keymap = vim.keymap

keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("n", "<F10>", ":!g++ -O2 -Wall -Wextra -Wshadow -Wno-unused-result -Wduplicated-cond -std=c++17 -o program % && ./program < input.txt > output.txt && cat output.txt<CR>", { buffer = true, desc = "..." })

keymap.set("n", "<leader>9", function()
	run_cmd(
		"-O2 -Wall -Wextra -Wformat=2 -Wshadow -Wno-unused-result "
			.. "-Wduplicated-cond -Wlogical-op -Wconversion -ggdb3 "
			.. "-D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC "
			.. "-fsanitize=undefined,address -fstack-protector-all",
		"input.txt"
	)
end, { desc = "Compile & run (debug)" })
