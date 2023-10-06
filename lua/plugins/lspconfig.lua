return {
    -- TODO: Improve lsp configuration
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

        -- clangd
        lspconfig.clangd.setup {
            capabilities = capabilities,
            on_init = function(client)
                local request = client.rpc.request
                function client.rpc.request(method, params, handler, ...)
                    if method ~= 'textDocument/completion' then
                        return request(method, params, handler, ...)
                    end
                    new_handler = function(...)
                        local err, result = ...
                        if err or not result then
                            return handler(...)
                        end
                        local items = result.items or result
                        for _, item in ipairs(items) do
                            local kind = vim.lsp.protocol.CompletionItemKind
                            if item.kind == kind.Snippet then
                                local text = item.textEdit.newText
                                text = text:gsub('{\n', '{\n\t')
                                item.textEdit.newText = text
                            end
                        end
                        return handler(...)
                    end
                    return request(method, params, new_handler, ...)
                end
            end
        }

        -- rust analyzer
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    diagnostics = {
                        enable = false;
                    }
                }
            }
        }

    end,
}
