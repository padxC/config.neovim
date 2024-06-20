-- others
local M = {
  "alexghergh/nvim-tmux-navigation", -- tmux intergration
  "ThePrimeagen/vim-be-good", -- vim chill, training
  "stevearc/dressing.nvim", -- a little aesthetic GUI
  event = "VeryLazy",
}

function M.config()
  require("nvim-web-devicons")
  require("dressing").setup()
  require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true,
  })
end

return M

