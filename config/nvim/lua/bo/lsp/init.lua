-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})
require("bo.lsp.inlay")

local lsp = require("lsp-zero").preset("recommended")

lsp.configure("rust_analyzer", {
    -- Managed by rustup.
    force_setup = true,
    on_attach = function (client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
           buffer = 0,
           callback = function()
             vim.lsp.buf.format { async = false }
           end,
       })
    end,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer",
    },
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
            },
        },
    },
})

lsp.configure("gopls", {
    on_attach = function (client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
           buffer = 0,
           callback = function()
             vim.lsp.buf.format { async = false }
           end,
       })
    end,
})

lsp.configure("hls", {
    -- Managed by ghcup.
    force_setup = true,
})

lsp.configure("zls", {
    -- Installed from source.
    force_setup = true,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  severity_sort = true,
})

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.ruff,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
