return {
    { "nvim-lua/plenary.nvim" },
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
    { "numToStr/Comment.nvim", opts = {} },
	{
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end,
	},
    {
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = "rose-pine",
        component_separators = "|",
        section_separators = "",
      },
    },
  },
}
