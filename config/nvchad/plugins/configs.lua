return {
  ["neovim/nvim-lspconfig"] = {
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    ensure_installed = {
      "c",
      "go",
      "haskell",
      "latex",
      "rust",
    },
  },
  -- HLS is install through ghcup.
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      "clangd",
      "gopls",
      "lua-language-server",
      "rust-analyzer",
    },
  },
}
