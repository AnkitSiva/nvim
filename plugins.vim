call plug#begin('~/.config/nvim/repos')
" LSP plugins
    Plug 'AnkitSiva/lspcontainers.nvim'
    Plug 'neovim/nvim-lspconfig'
" Autocomplete plugins
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'kosayoda/nvim-lightbulb'
" Snippet plugins
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'
" Writing plugins
	Plug 'davidbeckingsale/writegood.vim'
    Plug 'reedes/vim-pencil'
	Plug 'reedes/vim-wordy'
" Making vim pretty
	Plug 'flazz/vim-colorschemes'
	Plug 'mhinz/vim-startify'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
" File browser
	Plug 'scrooloose/nerdtree'
call plug#end()
