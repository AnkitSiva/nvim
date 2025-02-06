return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'AnkitSiva/lspcontainers.nvim',
        -- Recommended completion plugins
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        -- Snippets
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
        'rafamadriz/friendly-snippets',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
        },
        -- Get a lil lightbulb for when you have bad code
        'kosayoda/nvim-lightbulb',
        -- LSP status
        'j-hui/fidget.nvim',
        -- Lua LSP improvement
        'folke/neodev.nvim',
    },
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local opts = { noremap=true, silent=true }
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
        end

        require'lspconfig'.bashls.setup {
            cmd = require'lspcontainers'.command('bashls'),
            root_dir = vim.fs.root(0, '.git'),
            capabilities = capabilities,
            on_attach = on_attach,
        }

        require'lspconfig'.dockerls.setup {
            cmd = require'lspcontainers'.command('dockerls'),
            root_dir = vim.fs.root(0, '.git'),
            capabilities = capabilities,
            on_attach = on_attach,
        }

        require'lspconfig'.jsonls.setup {
            root_dir = vim.fs.root(0, '.git'),
            capabilities = capabilities,
            on_attach = on_attach,
        }

        require'lspconfig'.pyright.setup {
            root_dir = vim.fs.root(0, '.git'),
            capabilities = capabilities,
            on_attach = on_attach,
        }

        require'lspconfig'.rust_analyzer.setup {
            cmd = require'lspcontainers'.command('rust_analyzer'),
            root_dir = vim.fs.root(0, '.git'),
            capabilities = capabilities,
            on_attach = on_attach,
        }

        require'lspconfig'.lua_ls.setup {
            cmd = require'lspcontainers'.command('lua_ls'),
            on_new_config = (function(new_config, new_root_dir)
                new_config.cmd = require'lspcontainers'.command(server, { root_dir = new_root_dir })
            end),
            root_dir = vim.fs.root(0, '.git'),
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'},
                    },
                },
            },
        }

        require'lspconfig'.kotlin_language_server.setup {
            cmd = {"/home/ankitsiv/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"},
            capabilities = capabilities,
            workspaceFolders = true,
            root_dir = vim.fs.root(0, 'packageInfo'),
            on_attach = on_attach,
        }

        require'lspconfig'.ts_ls.setup {
            on_attach = on_attach,
        }

        require'lspconfig'.ruff.setup {
            root_dir = vim.fs.root(0, '.git'),
        }
    end,
}
