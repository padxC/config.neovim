-- others
local M = {
  { "alexghergh/nvim-tmux-navigation", event = "VeryLazy" }, -- tmux intergration
  { "ThePrimeagen/vim-be-good", event = "VeryLazy" }, -- vim chill, training
  { "stevearc/dressing.nvim", event = "VeryLazy" }, -- a little aesthetic GUI
}

function M.config()
  require("nvim-web-devicons")
  require("dressing").setup()
  require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true,
  })
end

return M

