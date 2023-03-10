return {
	{
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	},
    { "numToStr/Comment.nvim", opts = {} },
	{
        "windwp/nvim-autopairs",
        config = function() 
            require("nvim-autopairs").setup {} 
        end,
	},
    { 
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'rose-pine',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
}
