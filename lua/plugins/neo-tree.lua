return {
     "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    config = function()
        local neo = require("neo-tree")
        neo.setup({
            window = {
                width = 30,
                position = "left",
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = true,
                    hide_gitignored = false,
                    hide_dotfile = false,
                    show_hidden_count = true,
                    never_show = {
                        ".exe"
                    },
                    hide_hidden = false,
                }
            },
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            close_if_last_window = false,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
        })
        vim.keymap.set('n', '<leader>e', ":Neotree filesystem reveal toggle<CR>", {}) 
    end,
}
