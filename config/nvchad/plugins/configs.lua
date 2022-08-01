return {
  ["nvim-treesitter/nvim-treesitter"] = {
    ensure_installed = {
      "c",
      "go",
      "haskell",
      "latex",
      "lua",
      "rust",
    },
  },
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      "clangd",
      "gopls",
      "haskell-language-server",
      "lua-language-server",
      "rust-analyzer",
    },
  },
}
