return {
  "nvim-treesitter/nvim-treesitter",
  -- dependencies = {
  --   "HiPhish/rainbow-delimiters.nvim",
  -- },
  opts = {
    indent = {
      enable = false,
    },
    ensure_installed = {
      "javascript",
      "typescript",
      "css",
      "html",
      "prisma",
      "gitignore",
      "graphql",
      "http",
      "json",
      "scss",
      "sql",
      "vim",
      "lua",
    },
  },
}
