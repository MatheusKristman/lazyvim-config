return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with {
          env = {
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand '~/.config/nvim/utils/linter-config/.prettierrc.json',
          },
          prefer_local = true,
        },
        require('none-ls.diagnostics.eslint').with {
          prefer_local = true,
        },
      },
      -- AutoFormat on Save
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              -- vim.lsp.buf.formatting_sync()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = '[G]o [F]ormat' })
  end,
}
