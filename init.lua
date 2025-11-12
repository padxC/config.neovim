-----------------
-- user config --
-----------------
require("core.lsp")
require("core.launch")

require("config.options")
require("config.keymaps")
require("config.autocmds")

-----------------
---- plugins ----
-----------------

-- mini library
spec("plugins.mini")

-- GUIs
spec("plugins.colorscheme")
spec("plugins.lualine")

-- file navigation, editing
spec("plugins.telescope")
spec("plugins.undotree")
spec("plugins.tmux")
spec("plugins.oil")

-- syntax, formatting, completion
spec("plugins.tree-sitter")
--]]

require("core.lazy")
