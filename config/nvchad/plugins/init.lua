return {
  ["lervag/vimtex"] = {
    ft = "tex",
    config = function()
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
      }
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
}
