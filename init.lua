require("config.launch")
require("config.options")
require("config.keymaps")
require("config.autocmds")
--  comment to unplug-ins

-- GUIs
spec("plugins.colorscheme")
spec("plugins.others")
spec("plugins.statusline")

-- file navigation
spec("plugins.telescope")
spec("plugins.harpoon")
spec("plugins.oil")

-- lsp
spec("plugins.completion")
spec("plugins.mason")
spec("plugins.tree-sitter")
spec("plugins.lsp")

--obsidian note-taking
spec("plugins.obsidian")

require("config.nvim-lazy")
