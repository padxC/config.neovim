local M = {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.g.gruvbox_material_transparent_background = 1
  vim.g.gruvbox_material_foreground = "mix"
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_ui_contrast = "high"
  vim.g.gruvbox_material_float_style = "none"
  vim.g.gruvbox_material_cursor = "auto"
  vim.g.gruvbox_material_better_performance = 1

  vim.cmd.colorscheme("gruvbox-material")

  -- BlinkCmp specific color configuration
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#3c3836" }) -- Gruvbox selection color
  vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#504945" }) -- Gruvbox scrollbar color
  vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpLabel", { bg = "NONE", bold = true })
  vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { bg = "NONE", fg = "#928374", bold = true }) -- Gruvbox gray
  vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { bg = "NONE", fg = "#a89984", bold = true }) -- Gruvbox light gray
  vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { bg = "NONE", fg = "#a89984", bold = true }) -- Gruvbox light gray
  vim.api.nvim_set_hl(0, "BlinkCmpKind", { bg = "NONE", fg = "#fe8019" }) -- Gruvbox orange
  vim.api.nvim_set_hl(0, "BlinkCmpSource", { bg = "NONE", fg = "#d3869b" }) -- Gruvbox purple
  vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { bg = "NONE", fg = "#928374" }) -- Gruvbox gray
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "NONE", fg = "#504945" }) -- Gruvbox separator
  vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine", { bg = "#3c3836" }) -- Gruvbox selection color
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { bg = "NONE", fg = "#fe8019" }) -- Gruvbox orange

  -- You can also set specific kind colors if needed
  vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { bg = "NONE", fg = "#b8bb26" }) -- Gruvbox green
  vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { bg = "NONE", fg = "#83a598" }) -- Gruvbox blue
  vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { bg = "NONE", fg = "#fabd2f" }) -- Gruvbox yellow
  vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { bg = "NONE", fg = "#8ec07c" }) -- Gruvbox aqua
  vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { bg = "NONE", fg = "#d3869b" }) -- Gruvbox purple

end

return M
