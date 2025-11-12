local M = {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
}


function M.config()
  vim.g.gruvbox_material_transparent_background = 1
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_foreground = "mix"
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_ui_contrast = "high"
  vim.g.gruvbox_material_float_style = "blend"
  vim.g.gruvbox_material_cursor = "auto"

  vim.cmd.colorscheme("gruvbox-material")

end

return M
