return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neo = require "neo-tree"
        neo.setup {
            window = {
                width = 30,
                position = "left",
            },
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            close_if_last_window = false,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
        }
        vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal toggle<CR>", {})
    end,
}
