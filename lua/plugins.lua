-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = (function()
			require('rose-pine').setup({
				dark_variant = 'moon'
			})
			vim.cmd('colorscheme rose-pine')
		end)
	})

    use 'mhinz/vim-startify'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'theprimeagen/harpoon'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

	use { 
		'neovim/nvim-lspconfig',
		requires = {
			-- Personal lsp containers repo
			{use 'ankitsiva/lspcontainers.nvim'},
			-- Recommended completion plugins
			{use 'hrsh7th/cmp-nvim-lsp'},
			{use 'hrsh7th/cmp-buffer'},
			{use 'hrsh7th/cmp-path'},
			{use 'hrsh7th/cmp-cmdline'},
			{use 'hrsh7th/nvim-cmp'},
			-- Snippets
			{use 'hrsh7th/cmp-vsnip'},
			{use 'hrsh7th/vim-vsnip'},
			{use 'hrsh7th/vim-vsnip-integ'},
			{use 'rafamadriz/friendly-snippets'},
			{use 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*'},
			-- Get a lil lightbulb for when you have bad code
			{use 'kosayoda/nvim-lightbulb'},
		}
	}
end)
