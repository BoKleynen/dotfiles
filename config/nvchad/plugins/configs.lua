return {
  ["neovim/nvim-lspconfig"] = {
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    ensure_installed = {
      "haskell",
      "latex",
      "rust",
    },
  },
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      "lua-language-server",
      "rust-analyzer",
    },
  },
}
