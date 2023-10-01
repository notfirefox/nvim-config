return {
    -- TODO: Improve lsp configuration
    'neovim/nvim-lspconfig',
    config = function()
        -- variables
        local lspconfig = require('lspconfig')
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- auto format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup('format_code', {}),
            callback = function()
                vim.lsp.buf.format { async = false }
            end
        })

        -- set lsp bindings
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          end,
        })

        -- disable diagnostic signs
        vim.diagnostic.config({
            signs = false
        })

        -- clangd fix item function
        local function fixItem(item)
            if item.kind == vim.lsp.protocol.CompletionItemKind.Snippet then
                local index = item.textEdit.newText:find('{\n\t')
                if index == nil then
                    local newText = item.textEdit.newText:gsub('{\n', '{\n\t')
                    item.textEdit.newText = newText
                end
            end
        end

        -- clangd
        lspconfig.clangd.setup {
            capabilities = capabilities,
            on_attach = function(client)
                local orig_rpc_request = client.rpc.request
                function client.rpc.request(method, params, handler, ...)
                    local orig_handler = handler
                    if method == 'textDocument/completion' then
                        handler = function(...)
                            local err, result = ...
                            if not err and result then
                                local items = result.items or result
                                for _, item in ipairs(items) do
                                    fixItem(item)
                                end
                            end
                            return orig_handler(...)
                        end
                    end
                    return orig_rpc_request(method, params, handler, ...)
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
