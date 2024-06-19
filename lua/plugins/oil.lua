
local M = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
    require("oil").setup {
        default_file_explorerer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        columns = { "icon" },
        keymaps = {
            ["<C-h>"] = false,
            --["<M-h>"] = "actions.select_split",
        },
        view_options = {
            show_hidden = true,
        },
    }

    -- Open parent directory in current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "<space>e", require("oil").toggle_float)
end

return M



