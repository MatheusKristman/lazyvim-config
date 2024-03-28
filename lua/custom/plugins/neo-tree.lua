return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle file [E]xplorer' })
    end,
  },
}
