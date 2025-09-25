return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
      },
      { "mason-org/mason.nvim", opts = {} },
      { "mason-org/mason-lspconfig.nvim", opts = {} },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local builtin = require "telescope.builtin"
          vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = event.buf })
          vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = event.buf })
        end,
      })

      vim.lsp.config("rust_analyzer", {})
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            hints = {},
          },
        },
      })

      -- Installed through rustup.
      vim.lsp.enable "rust_analyzer"
    end,
  },
}
