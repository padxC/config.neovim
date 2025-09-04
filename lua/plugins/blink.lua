local M = {
  "saghen/blink.cmp",
  version = '1.*',
  event = "InsertEnter",
  dependencies = {
    { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    { "L3MON4D3/LuaSnip", event = "InsertEnter" },
  },
}

function M.config()
  require("blink.cmp").setup({
    snippets = { preset = "luasnip" },
    signature = { enabled = true },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'normal',
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        cmdline = {
          min_keyword_length = 2,
        },
      },
    },
    cmdline = {
      enabled = true,
      keymap = { preset = 'cmdline' },
      sources = { 'buffer', 'cmdline' },
      completion = { menu = { auto_show = true } },
    },
    completion = {
      menu = {
        scrollbar = false,
        scrolloff = 2,
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "label", "label_description", "kind", gap = 2 },
          },
        },
        winhighlight = "CursorLine:BlinkCmpMenuSelection",
      },
      documentation = {
        window = {
          scrollbar = false,
        },
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
        auto_show = true,
        auto_show_delay_ms = 300,
      },
    },
  })

  require("luasnip.loaders.from_vscode").lazy_load()

end

return M
