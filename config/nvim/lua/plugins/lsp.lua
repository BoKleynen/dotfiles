return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "bo.lsp"
        end,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { "j-hui/fidget.nvim", opts = {} },

            "folke/neodev.nvim"
        }
    },
}
