-- others
local M = {
  --{ "alexghergh/nvim-tmux-navigation", event = "VeryLazy" }, -- tmux intergration
  --{ "ThePrimeagen/vim-be-good", event = "VeryLazy" }, -- vim chill, training
  { "stevearc/dressing.nvim", event = "VeryLazy" }, -- a little aesthetic GUI
  {	"j-hui/fidget.nvim", tag = "legacy", event = { "BufEnter" }, } -- lsp status, progress
}

function M.config()
  require("dressing").setup()

  --require("nvim-tmux-navigation").setup({
      --disable_when_zoomed = true,
  --})

  require("fidget").setup({
    text = {
      spinner = "dots_negative",
    },
  })
end

return M

