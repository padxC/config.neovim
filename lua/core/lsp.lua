vim.lsp.enable({
  "lua_ls",
})

vim.diagnostic.config({
  virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = true,
    source = true,
    style = "minimal",
    header = "---Diagnostic---",
    prefix = "",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})

-- completion
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")
opt.updatetime = 200 -- faster completion (4000ms default)


