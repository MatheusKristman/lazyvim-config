return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    configs = true,
    config = function()
        local pair = require("nvim-autopairs")
        pair.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            disable_in_macro = true,  
            disable_in_visualblock = false,
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
    keys = {
        { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
        { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
        { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
        { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Deleth Buffer' },
        { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
        { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
        { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
        { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
        { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
        { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    },
}
