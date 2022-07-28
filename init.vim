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
set background=dark
set termguicolors
set completeopt=menu,menuone,noselect

source $NVIM_CONFIG_DIR/cmp_options.vim

colorscheme one-nvim

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

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "python", "kotlin", "bash", "dockerfile", "java", "latex", "lua"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  }
}
EOF


" Prevent unsafe commands in project specific configurations
set secure
