local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == '' then
        return ''
    else
        return 'Recording @' .. recording_register
    end
end

return {
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {
            options = {
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        icon = '',
                        icons_enabled = true,
                    },
                },
                lualine_b = { 'branch' },
                lualine_c = {
                    {
                        'diagnostics',
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = ' ',
                        },
                    },
                    {
                        'filetype',
                        icon_only = true,
                        separator = '',
                        padding = {
                            left = 1,
                            right = 0,
                        },
                    },
                    {
                        'filename',
                        path = 1,
                    },
                },
                lualine_x = {
                    {
                        'macro-recording',
                        fmt = show_macro_recording,
                    },
                    {
                        function()
                            return require('noice').api.status.command.get()
                        end,
                        cond = function()
                            return package.loaded['noice'] and require('noice').api.status.command.has()
                        end,
                    },
                    {
                        'diff',
                        symbols = {
                            added = ' ',
                            modified = ' ',
                            removed = ' ',
                        },
                        separator = ' ',
                        padding = { left = 1, right = 0 },
                    },
                    { 'filetype', padding = { left = 1, right = 1 } },
                },
                lualine_y = {
                    { 'progress', separator = ' ',                  padding = { left = 1, right = 0 } },
                    { 'location', padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function()
                        return ' ' .. os.date '%R'
                    end,
                },
            },
        },
    },
}
