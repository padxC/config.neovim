
local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
    { "hrsh7th/cmp-path", event = "InsertEnter" },
    { "hrsh7th/cmp-buffer", event = "InsertEnter" },
    { "hrsh7th/cmp-cmdline", event = "InsertEnter" },
  -----[[
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    { "onsails/lspkind.nvim", event = "InsertEnter" },

    { 
      "L3MON4D3/LuaSnip", 
        build = "make install_jsregexp",
        event = "InsertEnter",
        dependencies = {
          "rafamadriz/friendly-snippets",
      },
    },
  },
}

function M.config()
--
  local lspkind = require "lspkind"
  lspkind.init {}

  local cmp = require "cmp"
  cmp.setup {
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      --['<C-d>'] = cmp.mapping.scroll_docs(-4),
      --['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ["<C-y>"] = cmp.mapping( -- yess
        cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        { "i", "c" }
      ),
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    snippet = { -- for lua users
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
  }

  local ls = require "luasnip"
  ls.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
  }
end

return M
