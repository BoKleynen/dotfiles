-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

local lsp = require('lsp-zero').preset("recommended")

lsp.configure("rust_analyzer", {
    cmd = {
        "rustup", "run", "stable", "rust-analyzer",
    },
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
