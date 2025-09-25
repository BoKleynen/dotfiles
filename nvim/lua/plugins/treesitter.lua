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
            "vimdoc",
         },
         auto_install = false,
         highlight = { enable = true },
         indent = { enable = true },
      },
   }
}
