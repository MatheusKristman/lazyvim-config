return {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")
        catppuccin.setup({
            transparent_background = false, -- disables setting the background color.
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            styles = {
                indent_blankline = {
                    enabled = true,
                    scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                    colored_indent_levels = false,
                },
                mason = true,
                neotree = true,
                cmp = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                treesitter = true,
                ts_rainbow2 = true,
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end
}
