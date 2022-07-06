let $NVIM_CONFIG_DIR='~/.config/nvim/'
source $NVIM_CONFIG_DIR/plugins.vim

source $NVIM_CONFIG_DIR/plugin_options.vim

source $NVIM_CONFIG_DIR/remaps.vim

" LSP autoformatting
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100000)

" Turn on project-specific configurations
set exrc

set statusline+=%#warningmsg#
set statusline+=%*
set spelllang=en

if $TMUX == ''
    set clipboard+=unnamed
endif

set noswapfile
set modeline
set mouse=n
set number
set relativenumber
set showmatch
set matchtime=0
set showmode
set shiftwidth=4
set expandtab
set tabstop=4
set path+=**
set omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menu,menuone,noselect
syntax on

source $NVIM_CONFIG_DIR/cmp_options.vim

" Inspect $TERM instad of t_Co as it works in neovim as well
if &term =~ '256color'
    " Enable true (24-bit) colors instead of (8-bit) 256 colors.
    " :h true-color
    if has('termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    endif
    colorscheme Gruvbox
else
    colorscheme Tomorrow-Night
endif

au BufRead,BufNewfile Dockerfile* setfiletype Dockerfile

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" To close vim when nerdTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require'lspconfig/util'
require'lspconfig'.bashls.setup {
    cmd = require'lspcontainers'.command('bashls'),
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    capabilities = capabilities
    }

require'lspconfig'.dockerls.setup {
    cmd = require'lspcontainers'.command('dockerls'),
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    capabilities = capabilities
    }

require'lspconfig'.jsonls.setup {
    cmd = require'lspcontainers'.command('jsonls'),
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    capabilities = capabilities
    }


require'lspconfig'.pylsp.setup {
    cmd = require'lspcontainers'.command('pylsp'),
    capabilities = capabilities
    }
EOF


" Prevent unsafe commands in project specific configurations
set secure
