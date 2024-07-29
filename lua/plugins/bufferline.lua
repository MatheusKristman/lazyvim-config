return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                indicator = {
                    style = 'underline',
                },
                separator_style = "slope",
            }
        })
    end
}
