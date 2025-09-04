local M = {
  "aserowy/tmux.nvim",
  event = "VeryLazy"
}

function M.config()
  require("tmux").setup({
    resize = {
      enable_default_keybindings = false,
    },
  })
  -- using aserowy/tmux.nvim for resizing
  vim.keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
  vim.keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
  vim.keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
  vim.keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

end

return M
