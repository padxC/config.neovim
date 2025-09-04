local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      json = { "prettier" },
    },
  })
end

return M
