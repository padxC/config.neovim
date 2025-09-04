-----------------
-- user config --
-----------------
require("core.lsp")
require("core.launch")

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.terminal")

-----------------
---- plugins ----
-----------------

-- mini library
spec("plugins.mini")

-- GUIs
spec("plugins.colorscheme")
spec("plugins.lualine")
-- spec("plugins.dressing")
spec("plugins.fidget")

-- file navigation, editing
spec("plugins.telescope")
spec("plugins.harpoon")
spec("plugins.oil")
spec("plugins.tmux")
spec("plugins.undotree")

-- syntax, formatting, completion
spec("plugins.blink")
spec("plugins.tree-sitter")
spec("plugins.conform")

-- note-taking
--spec("plugins.obsidian")
--]]

require("core.lazy")
