-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
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
            { 'ankitsiva/lspcontainers.nvim' },
            -- Recommended completion plugins
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/nvim-cmp' },
            -- Snippets
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
            { 'hrsh7th/vim-vsnip-integ' },
            { 'rafamadriz/friendly-snippets' },
            { 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*' },
            -- Get a lil lightbulb for when you have bad code
            { 'kosayoda/nvim-lightbulb' },
            -- LSP status
            { 'j-hui/fidget.nvim' },
            -- Lua LSP improvement
            { 'folke/neodev.nvim' }
        }
    }


    use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'


end)
