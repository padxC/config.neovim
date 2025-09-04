local M = {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.g.gruvbox_material_transparent_background = 1
  vim.g.gruvbox_material_foreground = "original"
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_ui_contrast = "high"
  vim.g.gruvbox_material_float_style = "none"
  vim.g.gruvbox_material_cursor = "auto"

  vim.g.gruvbox_material_better_performance = 1

  vim.cmd.colorscheme("gruvbox-material")


  -- -- Gruvbox Material High Contrast Colors
  -- local bg_dark = '#1d2021'  -- Dark background
  -- local border = '#665c54'     -- Border color
  -- local selection = '#458588'  -- Blue selection (high contrast)
  -- local text = '#ebdbb2'       -- Main text color
  -- local text_secondary = '#a89984' -- Secondary text
  -- local accent = '#83a598'     -- Blue accent
  -- local yellow = '#fabd2f'     -- Yellow
  -- local green = '#b8bb26'      -- Green
  -- local orange = '#fe8019'     -- Orange
  --
  -- -- Completion Menu (High Contrast)
  -- vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { bg = bg_dark })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { bg = bg_dark, fg = border })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { bg = selection, fg = bg_dark, bold = true })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpScrollBarThumb', { bg = '#504945' })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpScrollBarGutter', { bg = bg_dark })
  --
  -- -- Text Elements (High Contrast)
  -- vim.api.nvim_set_hl(0, 'BlinkCmpLabel', { bg = bg_dark, fg = text, bold = true })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpLabelDeprecated', { bg = bg_dark, fg = text_secondary, strikethrough = true })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpLabelDetail', { bg = bg_dark, fg = text_secondary })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', { bg = bg_dark, fg = text_secondary })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKind', { bg = bg_dark, fg = accent, bold = true })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpSource', { bg = bg_dark, fg = text_secondary })
  --
  -- -- Documentation Window
  -- vim.api.nvim_set_hl(0, 'BlinkCmpDoc', { bg = bg_dark })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { bg = bg_dark, fg = border })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpDocSeparator', { bg = bg_dark, fg = border })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpDocCursorLine', { bg = '#3c3836' })
  --
  -- -- Signature Help
  -- vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelp', { bg = bg_dark })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { bg = bg_dark, fg = border })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpActiveParameter', { bg = selection, fg = bg_dark, bold = true })
  --
  -- -- Individual Kind Colors (Gruvbox Material High Contrast)
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindText', { bg = bg_dark, fg = accent })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindMethod', { bg = bg_dark, fg = green })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindFunction', { bg = bg_dark, fg = yellow })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindConstructor', { bg = bg_dark, fg = orange })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindField', { bg = bg_dark, fg = green })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindVariable', { bg = bg_dark, fg = accent })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindClass', { bg = bg_dark, fg = orange })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindInterface', { bg = bg_dark, fg = accent })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindModule', { bg = bg_dark, fg = yellow })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindProperty', { bg = bg_dark, fg = accent })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindUnit', { bg = bg_dark, fg = green })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindValue', { bg = bg_dark, fg = yellow })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindEnum', { bg = bg_dark, fg = orange })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindKeyword', { bg = bg_dark, fg = accent })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindSnippet', { bg = bg_dark, fg = yellow })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindColor', { bg = bg_dark, fg = orange })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindFile', { bg = bg_dark, fg = accent })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindReference', { bg = bg_dark, fg = yellow })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindFolder', { bg = bg_dark, fg = orange })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindEnumMember', { bg = bg_dark, fg = green })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindConstant', { bg = bg_dark, fg = yellow })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindStruct', { bg = bg_dark, fg = orange })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindEvent', { bg = bg_dark, fg = accent })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindOperator', { bg = bg_dark, fg = green })
  -- vim.api.nvim_set_hl(0, 'BlinkCmpKindTypeParameter', { bg = bg_dark, fg = yellow })
  --

end

return M
