-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
    "clangd",
    "gopls",
    "tsserver",
    "zls",
})

lsp.configure("rust_analyzer", {
    on_attach = function (client, bufnr)
        vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
        vim.api.nvim_create_autocmd("BufWritePre", {
           buffer = 0,
           callback = function()
             vim.lsp.buf.format { async = false }
           end,
       })
    end,
    force_setup = true,
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
        vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
        vim.api.nvim_create_autocmd("BufWritePre", {
           buffer = 0,
           callback = function()
             vim.lsp.buf.format { async = false }
           end,
       })
    end,
})

lsp.configure("hls", {
    force_setup = true,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
