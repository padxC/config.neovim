-- others
local M = {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "ThePrimeagen/vim-be-good", -- vim chill, training
  "stevearc/dressing.nvim",
  event = "VeryLazy",
}

function M.config()
  require("nvim-web-devicons")
  require("dressing").setup()
end

return M

