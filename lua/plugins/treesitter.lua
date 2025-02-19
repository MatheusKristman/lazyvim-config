return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  opts = {
    indent = {
      enable = false,
    },
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "latex",
      "javascript",
      "typescript",
      "tsx",
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
      "dockerfile",
    },
  },
}
