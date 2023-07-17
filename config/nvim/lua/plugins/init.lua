return {
	{
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup()
            vim.cmd("colorscheme rose-pine")
        end,
	},
	{ "windwp/nvim-autopairs", opts = {} },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
                theme = "rose-pine",
                component_separators = "|",
                section_separators = "",
            },
        },
    },
    { "ziglang/zig.vim", ft = "zig" },
}
