local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "bash",
      "vim",
      "c",
      "vimdoc",
      "query",
      "sql",
      "cpp",
      "asm",
    },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    autotag = { enable = true },
    autopairs = { enable = true },
  })
end

return M
