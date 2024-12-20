-- user config
require("config.launch")
require("config.options")
require("config.keymaps")
require("config.autocmds")
-- comment to unplug-ins

-- GUIs
spec("plugins.colorscheme")
spec("plugins.lualine")
spec("plugins.ui")

-- file navigation
spec("plugins.telescope")
spec("plugins.harpoon")
spec("plugins.oil")
spec("plugins.tmux")

-- lsp
spec("plugins.mason")
spec("plugins.lsp")

-- syntax, formatting, completion
spec("plugins.completion")
spec("plugins.tree-sitter")
spec("plugins.formatting")

--obsidian note-taking
--spec("plugins.obsidian")

--]]
require("config.nvim-lazy")
