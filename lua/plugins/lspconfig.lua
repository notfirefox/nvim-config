return {
    'neovim/nvim-lspconfig',
    config = function()
        -- variables
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- auto format on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('format_code', {}),
            callback = function()
                vim.lsp.buf.format { async = false }
            end
        })

        -- set lsp bindings
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp_attach', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                local bind = vim.keymap.set
                bind('n', '<leader>rn', vim.lsp.buf.rename, opts)
                bind('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            end,
        })

        -- disable diagnostic signs
        vim.diagnostic.config({
            signs = false
        })

        -- bash
        lspconfig.bashls.setup {}

        -- haskell
        lspconfig.hls.setup {
            capabilities = capabilities,
            settings = {
                haskell = {
                    formattingProvider = "fourmolu"
                }
            }
        }

        -- lua
        lspconfig.lua_ls.setup {
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                        Lua = {
                            runtime = {
                                version = 'LuaJIT'
                            },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME
                                }
                            }
                        }
                    })

                    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
                return true
            end
        }

        -- rust
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    check = {
                        command = "clippy"
                    },
                    diagnostics = {
                        enable = false
                    }
                }
            }
        }
    end,
}
