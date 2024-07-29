return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'jonarrien/telescope-cmdline.nvim',
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown{}
                },
                cmdline = {
                    picker = {
                        layout_config = {
                            width  = 120,
                            height = 25,
                        }
                    },
                    mappings    = {
                        complete      = '<Tab>',
                        run_selection = '<C-CR>',
                        run_input     = '<CR>',
                    },
                },
            },
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        require("telescope").load_extension("ui-select")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Find String" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help" })
        vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = "Find Todos" })
        vim.api.nvim_set_keymap('n', ':', ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
    end
}
