--M for module
local M = {
    "rebelot/kanagawa.nvim",
    lazy = false, -- immediately setup 
    priority = 1000,
}

function M.config()
  require('kanagawa').setup({
    -- ....
    overrides = function(colors)
        local theme = colors.theme
        return {
            -- Assign a static color to strings
            String = { fg = colors.palette.carpYellow, bold = true },
            -- theme colors will update dynamically when you change theme!
            SomePluginHl = { fg = colors.theme.syn.type, bold = true },

            --- UI for completion menu
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            --- UI for floating window looks nicer
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
    end,
    -- ...
})

  -- Kanagawa comes in three variants: wave -- dragon -- lotus
  require("kanagawa").load("wave")
end

return M
