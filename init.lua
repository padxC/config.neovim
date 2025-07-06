-----------------
-- user config --
-----------------
require("config.launch")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.terminal")
-- comment to unplugins

-----------------
---- plugins ----
-----------------

-- mini library
spec("plugins.mini")

-- GUIs
spec("plugins.colorscheme")
spec("plugins.lualine")
spec("plugins.dressing")
spec("plugins.fidget")

-- file navigation, editing
spec("plugins.telescope")
spec("plugins.harpoon")
spec("plugins.oil")
spec("plugins.tmux")
spec("plugins.undotree")
spec("plugins.surround")
spec("plugins.hardtime")

-- lsp-server
spec("plugins.mason")
spec("plugins.lsp")

-- syntax, formatting, completion
spec("plugins.completion")
spec("plugins.tree-sitter")
spec("plugins.formatting")

-- note-taking
spec("plugins.obsidian")

--]]
require("config.lazy")
