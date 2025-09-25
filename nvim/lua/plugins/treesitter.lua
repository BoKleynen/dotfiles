return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "caddy",
        "gitcommit",
        "gitignore",
        "go",
        "just",
        "lua",
        "markdown",
        "nix",
        "terraform",
        "vimdoc",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
