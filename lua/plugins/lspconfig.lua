-- create clang-format file
local file = vim.fn.expand("~/.clang-format")
if not vim.uv.fs_stat(file) then
    local text = { "---", "BasedOnStyle: LLVM", "IndentWidth: 4" }
    vim.fn.writefile(text, file)
end

return {
    "neovim/nvim-lspconfig",
    config = function()
        -- variables
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- auto format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("format_code", {}),
            callback = function()
                vim.lsp.buf.format { async = false }
            end
        })

        -- set lsp bindings
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp_attach", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                local bind = vim.keymap.set
                bind('n', 'K', vim.lsp.buf.hover, opts)
                bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
                bind("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })

        -- disable diagnostic signs
        vim.diagnostic.config({
            signs = false
        })

        -- bash
        lspconfig.bashls.setup {
            capabilities = capabilities,
        }

        -- clangd
        lspconfig.clangd.setup {
            capabilities = capabilities,
            on_init = function(client)
                local request = client.rpc.request
                function client.rpc.request(method, params, handler, ...)
                    if method ~= "textDocument/completion" then
                        return request(method, params, handler, ...)
                    end
                    local new_handler = function(...)
                        local err, result = ...
                        if err or not result then
                            return handler(...)
                        end
                        local items = result.items or result
                        for _, item in ipairs(items) do
                            local kind = vim.lsp.protocol.CompletionItemKind
                            if item.kind == kind.Snippet then
                                local text = item.textEdit.newText
                                text = text:gsub("{\n", "{\n\t")
                                item.textEdit.newText = text
                            end
                        end
                        return handler(...)
                    end
                    return request(method, params, new_handler, ...)
                end
            end,
        }

        -- lua
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.uv.fs_stat(path .. "/.luarc.json") or
                    vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                    return
                end
                client.config.settings.Lua = vim.tbl_deep_extend(
                    "force",
                    client.config.settings.Lua, {
                        runtime = {
                            version = "LuaJIT"
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                "${3rd}/luv/library"
                            }
                        }
                    })
            end,
            settings = {
                Lua = {}
            }
        }

        -- rust
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
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
