
local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Change keybindings
  keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
  keymap("n", "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)

  -- Set <leader>1 to <leader>5 for selecting files
  for idx = 1, 5 do
    keymap("n", string.format("<leader>%d", idx), string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<cr>", idx), opts)
  end
end

-- notification 
function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
