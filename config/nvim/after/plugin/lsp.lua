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

lsp.configure("hls", {
    force_setup = true,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
