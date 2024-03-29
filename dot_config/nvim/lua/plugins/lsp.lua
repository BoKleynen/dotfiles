return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },

            -- Useful status updates for LSP
            { "j-hui/fidget.nvim", opts = {}, tag = "legacy" },
        },
        config = function()
           require("bo.lsp")
        end
    },
    "simrat39/inlay-hints.nvim",
    "folke/neodev.nvim",
    "jose-elias-alvarez/null-ls.nvim",
}
