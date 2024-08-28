return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.1",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  opts = {
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
    indent = {
      enable = false,
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  },
}
