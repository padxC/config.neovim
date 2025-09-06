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

  local colors = {
    base00 = "#1d2021", -- darkest background
    base01 = "#282828", -- darker background
    base02 = "#32302f", -- dark background
    base03 = "#504945", -- medium background
    base04 = "#665c54", -- light background
    base05 = "#d4be98", -- primary text
    base06 = "#ddc7a1", -- bright text
    base07 = "#ebdbb2", -- brightest text
    base08 = "#ea6962", -- red accent
    base09 = "#e78a4e", -- orange accent
    base0A = "#d8a657", -- yellow accent
    base0B = "#a9b665", -- green accent
    base0C = "#89b482", -- cyan accent
    base0D = "#7daea3", -- blue accent
    base0E = "#d3869b", -- purple accent
    base0F = "#bd6f3c", -- brown accent
  }

  local material_hard_colors = {
    -- Background colors
    bg_darkest = colors.base00,   -- main background
    bg_darker = colors.base01,    -- darker background for floating windows
    bg_dark = colors.base02,      -- surface color
    bg_medium = colors.base03,    -- lighter surface
    bg_light = colors.base04,     -- even lighter surface

    -- Text colors
    text_primary = colors.base05, -- main text
    text_secondary = colors.base04, -- dimmer text
    text_tertiary = colors.base03, -- even dimmer text

    -- Overlay colors
    overlay_dark = colors.base03,
    overlay_medium = colors.base04,
    overlay_light = colors.base06,

    -- Accent colors (high contrast)
    accent_red = colors.base08,    -- red accent
    accent_orange = colors.base09, -- orange accent
    accent_yellow = colors.base0A, -- yellow accent
    accent_green = colors.base0B,  -- green accent
    accent_cyan = colors.base0C,   -- cyan accent
    accent_blue = colors.base0D,   -- blue accent
    accent_purple = colors.base0E, -- purple accent
  }

  -- Apply all the custom highlight groups with high contrast
  local highlights = {
    -- Completion menu styling
    Pmenu = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary },
    PmenuSel = { bg = material_hard_colors.bg_dark, fg = material_hard_colors.text_primary, bold = true },
    PmenuSbar = { bg = material_hard_colors.bg_dark },
    PmenuThumb = { bg = material_hard_colors.bg_light },
    PmenuExtra = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_secondary },

    -- Floating windows
    NormalFloat = { bg = material_hard_colors.bg_darker },
    FloatBorder = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.bg_light },
    FloatTitle = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary, bold = true },

    -- Blink.cmp specific highlighting
    BlinkCmpMenu = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary },
    BlinkCmpMenuBorder = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.bg_light },
    BlinkCmpMenuSelection = { bg = material_hard_colors.bg_dark, fg = material_hard_colors.text_primary, bold = true },
    BlinkCmpScrollBarThumb = { bg = material_hard_colors.bg_light },
    BlinkCmpScrollBarGutter = { bg = material_hard_colors.bg_dark },
    BlinkCmpLabel = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary },
    BlinkCmpLabelDeprecated = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.overlay_dark, strikethrough = true },
    BlinkCmpLabelDetail = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_secondary },
    BlinkCmpLabelDescription = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_secondary },
    BlinkCmpKind = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.accent_orange, bold = true },
    BlinkCmpSource = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.overlay_medium },
    BlinkCmpGhostText = { fg = material_hard_colors.overlay_dark, italic = true },
    BlinkCmpDoc = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary },
    BlinkCmpDocBorder = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.bg_light },
    BlinkCmpDocSeparator = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.bg_medium },
    BlinkCmpDocCursorLine = { bg = material_hard_colors.bg_dark },
    BlinkCmpSignatureHelp = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary },
    BlinkCmpSignatureHelpBorder = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.bg_light },
    BlinkCmpSignatureHelpActiveParameter = { bg = material_hard_colors.bg_dark, fg = material_hard_colors.accent_orange, bold = true },

    -- Snacks.nvim picker NvChad style
    -- SnacksPicker = { bg = material_hard_colors.bg_darkest },
    -- SnacksPickerBorder = { fg = material_hard_colors.bg_dark, bg = material_hard_colors.bg_darkest },
    -- SnacksPickerPreview = { bg = material_hard_colors.bg_darkest },
    -- SnacksPickerPreviewBorder = { fg = material_hard_colors.bg_darkest, bg = material_hard_colors.bg_darkest },
    -- SnacksPickerPreviewTitle = { fg = material_hard_colors.bg_darkest, bg = material_hard_colors.accent_green, bold = true },
    -- SnacksPickerBoxBorder = { fg = material_hard_colors.bg_darkest, bg = material_hard_colors.bg_darkest },
    -- SnacksPickerInputBorder = { fg = material_hard_colors.bg_light, bg = material_hard_colors.bg_darkest },
    -- SnacksPickerInputSearch = { fg = material_hard_colors.text_primary, bg = material_hard_colors.bg_darkest },
    -- SnacksPickerList = { bg = material_hard_colors.bg_darkest },
    -- SnacksPickerListBorder = { fg = material_hard_colors.bg_darkest, bg = material_hard_colors.bg_darkest },
    -- SnacksPickerListTitle = { fg = material_hard_colors.bg_darkest, bg = material_hard_colors.bg_darkest },
    --
    -- -- Additional picker elements
    -- SnacksPickerDir = { fg = material_hard_colors.accent_blue, bold = true },
    -- SnacksPickerFile = { fg = material_hard_colors.text_primary },
    -- SnacksPickerMatch = { fg = material_hard_colors.accent_orange, bold = true },
    -- SnacksPickerCursor = { bg = material_hard_colors.bg_dark, fg = material_hard_colors.text_primary },
    -- SnacksPickerSelected = { bg = material_hard_colors.bg_dark, fg = material_hard_colors.text_primary, bold = true },
    -- SnacksPickerIcon = { fg = material_hard_colors.accent_blue },
    -- SnacksPickerSource = { fg = material_hard_colors.overlay_medium },
    -- SnacksPickerCount = { fg = material_hard_colors.overlay_medium },
    -- SnacksPickerFooter = { fg = material_hard_colors.overlay_medium },
    -- SnacksPickerHeader = { fg = material_hard_colors.text_primary, bold = true },
    -- SnacksPickerSpecial = { fg = material_hard_colors.accent_orange, bold = true },
    -- SnacksPickerIndent = { fg = material_hard_colors.bg_medium },
    -- SnacksPickerMulti = { fg = material_hard_colors.accent_orange, bold = true },
    -- SnacksPickerTitle = { fg = material_hard_colors.text_primary, bold = true },
    -- SnacksPickerPrompt = { fg = material_hard_colors.text_primary, bold = true },
    --
    -- -- Snacks core components
    -- SnacksNotifierNormal = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary },
    -- SnacksNotifierBorder = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.bg_light },
    -- SnacksNotifierTitle = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary, bold = true },
    -- SnacksNotifierIcon = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.accent_blue },
    -- SnacksNotifierIconInfo = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.accent_blue },
    -- SnacksNotifierIconWarn = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.accent_yellow },
    -- SnacksNotifierIconError = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.accent_red },
    --
    -- -- Snacks Dashboard
    -- SnacksDashboardNormal = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.text_primary },
    -- SnacksDashboardDesc = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.text_secondary },
    -- SnacksDashboardFile = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.text_primary },
    -- SnacksDashboardDir = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.accent_blue, bold = true },
    -- SnacksDashboardFooter = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.overlay_medium },
    -- SnacksDashboardHeader = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.text_primary, bold = true },
    -- SnacksDashboardIcon = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.accent_blue },
    -- SnacksDashboardKey = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.accent_orange, bold = true },
    -- SnacksDashboardTerminal = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.text_primary },
    -- SnacksDashboardSpecial = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.accent_orange, bold = true },
    --
    -- -- Snacks Terminal
    -- SnacksTerminalNormal = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary },
    -- SnacksTerminalBorder = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.bg_light },
    -- SnacksTerminalTitle = { bg = material_hard_colors.bg_darker, fg = material_hard_colors.text_primary, bold = true },
    --
    -- Other UI elements
    CmpItemMenu = { fg = material_hard_colors.bg_light },
    CursorLineNr = { fg = material_hard_colors.text_primary, bold = true },
    GitSignsChange = { fg = material_hard_colors.accent_orange, bold = true },
    LineNr = { fg = material_hard_colors.overlay_dark },
    LspInfoBorder = { link = "FloatBorder" },
    VertSplit = { bg = material_hard_colors.bg_darkest, fg = material_hard_colors.bg_dark },
    WhichKeyFloat = { bg = material_hard_colors.bg_darker },
    YankHighlight = { bg = material_hard_colors.bg_light },
    FidgetTask = { fg = material_hard_colors.text_secondary },
    FidgetTitle = { fg = material_hard_colors.accent_orange, bold = true },

    -- Indent guides
    IblIndent = { fg = material_hard_colors.bg_dark },
    IblScope = { fg = material_hard_colors.overlay_dark },

    -- Syntax highlighting
    Boolean = { fg = material_hard_colors.accent_purple, bold = true },
    Number = { fg = material_hard_colors.accent_purple, bold = true },
    Float = { fg = material_hard_colors.accent_purple, bold = true },

    PreProc = { fg = material_hard_colors.accent_purple, bold = true },
    PreCondit = { fg = material_hard_colors.accent_purple, bold = true },
    Include = { fg = material_hard_colors.accent_purple, bold = true },
    Define = { fg = material_hard_colors.accent_purple, bold = true },
    Conditional = { fg = material_hard_colors.accent_red, bold = true },
    Repeat = { fg = material_hard_colors.accent_red, bold = true },
    Keyword = { fg = material_hard_colors.accent_red, bold = true },
    Typedef = { fg = material_hard_colors.accent_red, bold = true },
    Exception = { fg = material_hard_colors.accent_red, bold = true },
    Statement = { fg = material_hard_colors.accent_red, bold = true },

    Error = { fg = material_hard_colors.accent_red, bold = true },
    StorageClass = { fg = material_hard_colors.accent_orange, bold = true },
    Tag = { fg = material_hard_colors.accent_orange, bold = true },
    Label = { fg = material_hard_colors.accent_orange, bold = true },
    Structure = { fg = material_hard_colors.accent_orange, bold = true },
    Operator = { fg = material_hard_colors.accent_orange, bold = true },
    Title = { fg = material_hard_colors.accent_orange, bold = true },
    Special = { fg = material_hard_colors.accent_yellow, bold = true },
    SpecialChar = { fg = material_hard_colors.accent_yellow, bold = true },
    Type = { fg = material_hard_colors.accent_yellow, bold = true },
    Function = { fg = material_hard_colors.accent_green, bold = true },
    Delimiter = { fg = material_hard_colors.text_secondary },
    Ignore = { fg = material_hard_colors.text_secondary },
    Macro = { fg = material_hard_colors.accent_cyan, bold = true },

    -- Treesitter highlights
    TSAnnotation = { fg = material_hard_colors.accent_purple, bold = true },
    TSAttribute = { fg = material_hard_colors.accent_purple, bold = true },
    TSBoolean = { fg = material_hard_colors.accent_purple, bold = true },
    TSCharacter = { fg = material_hard_colors.accent_cyan, bold = true },
    TSCharacterSpecial = { link = "SpecialChar" },
    TSComment = { fg = material_hard_colors.text_secondary, italic = true },
    TSConditional = { fg = material_hard_colors.accent_red, bold = true },
    TSConstBuiltin = { fg = material_hard_colors.accent_purple, bold = true },
    TSConstMacro = { fg = material_hard_colors.accent_purple, bold = true },
    TSConstant = { fg = material_hard_colors.text_primary, bold = true },
    TSConstructor = { fg = material_hard_colors.accent_green, bold = true },
    TSDebug = { link = "Debug" },
    TSDefine = { link = "Define" },
    TSEnvironment = { link = "Macro" },
    TSEnvironmentName = { link = "Type" },
    TSError = { link = "Error" },
    TSException = { fg = material_hard_colors.accent_red, bold = true },
    TSField = { fg = material_hard_colors.accent_blue, bold = true },
    TSFloat = { fg = material_hard_colors.accent_purple, bold = true },
    TSFuncBuiltin = { fg = material_hard_colors.accent_green, bold = true },
    TSFuncMacro = { fg = material_hard_colors.accent_green, bold = true },
    TSFunction = { fg = material_hard_colors.accent_green, bold = true },
    TSFunctionCall = { fg = material_hard_colors.accent_green, bold = true },
    TSInclude = { fg = material_hard_colors.accent_red, bold = true },
    TSKeyword = { fg = material_hard_colors.accent_red, bold = true },
    TSKeywordFunction = { fg = material_hard_colors.accept_red, bold = true },
    TSKeywordOperator = { fg = material_hard_colors.accent_orange, bold = true },
    TSKeywordReturn = { fg = material_hard_colors.accent_red, bold = true },
    TSLabel = { fg = material_hard_colors.accent_orange, bold = true },
    TSLiteral = { link = "String" },
    TSMath = { fg = material_hard_colors.accent_blue, bold = true },
    TSMethod = { fg = material_hard_colors.accent_green, bold = true },
    TSMethodCall = { fg = material_hard_colors.accent_green, bold = true },
    TSNamespace = { fg = material_hard_colors.accent_yellow, bold = true },
    TSNone = { fg = material_hard_colors.text_primary },
    TSNumber = { fg = material_hard_colors.accent_purple, bold = true },
    TSOperator = { fg = material_hard_colors.accent_orange, bold = true },
    TSParameter = { fg = material_hard_colors.text_primary },
    TSParameterReference = { fg = material_hard_colors.text_primary },
    TSPreProc = { link = "PreProc" },
    TSProperty = { fg = material_hard_colors.accent_blue, bold = true },
    TSPunctBracket = { fg = material_hard_colors.text_primary },
    TSPunctDelimiter = { link = "Delimiter" },
    TSPunctSpecial = { fg = material_hard_colors.accent_blue, bold = true },
    TSRepeat = { fg = material_hard_colors.accent_red, bold = true },
    TSStorageClass = { fg = material_hard_colors.accent_orange, bold = true },
    TSStorageClassLifetime = { fg = material_hard_colors.accent_orange, bold = true },
    TSStrike = { fg = material_hard_colors.text_secondary },
    TSString = { fg = material_hard_colors.accent_cyan, bold = true },
    TSStringEscape = { fg = material_hard_colors.accent_green, bold = true },
    TSStringRegex = { fg = material_hard_colors.accent_green, bold = true },
    TSStringSpecial = { link = "SpecialChar" },
    TSSymbol = { fg = material_hard_colors.text_primary },
    TSTag = { fg = material_hard_colors.accent_orange, bold = true },
    TSTagAttribute = { fg = material_hard_colors.accent_green, bold = true },
    TSTagDelimiter = { fg = material_hard_colors.accent_green, bold = true },
    TSText = { fg = material_hard_colors.accent_green, bold = true },
    TSTextReference = { link = "Constant" },
    TSTitle = { link = "Title" },
    TSTodo = { bg = material_hard_colors.accent_yellow, fg = material_hard_colors.bg_darkest, bold = true },
    TSType = { fg = material_hard_colors.accent_yellow, bold = true },
    TSTypeBuiltin = { fg = material_hard_colors.accent_yellow, bold = true },
    TSTypeDefinition = { fg = material_hard_colors.accent_yellow, bold = true },
    TSTypeQualifier = { fg = material_hard_colors.accent_orange, bold = true },
    TSURI = { fg = material_hard_colors.accent_blue, underline = true },
    TSVariable = { fg = material_hard_colors.text_primary },
    TSVariableBuiltin = { fg = material_hard_colors.accent_purple, bold = true },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

end

return M
