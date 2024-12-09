return {
    "neovim/nvim-lspconfig",
    config = function()
        -- variables
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- disable diagnostic signs
        vim.diagnostic.config({
            signs = false
        })

        -- setup the lsp only if it is available
        local function setup_lsp(lsp, config)
            local cmd = lspconfig[lsp].document_config.default_config.cmd[1]
            if vim.fn.executable(cmd) == 1 then
                lspconfig[lsp].setup(config)
            end
        end

        -- lsp table
        local lsp = {}

        -- bash
        lsp.bashls = {
            capabilities = capabilities,
        }

        -- clangd
        lsp.clangd = {
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

        -- haskell
        lsp.hls = {
            capabilities = capabilities,
            settings = {
                haskell = {
                    formattingProvider = "fourmolu"
                }
            }
        }

        -- lua
        lsp.lua_ls = {
            capabilities = capabilities,
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if (vim.uv or vim.loop).fs_stat(path .. "/.luarc.json") or
                    (vim.uv or vim.loop).fs_stat(path .. "/.luarc.jsonc") then
                    return
                end
                client.config.settings.Lua = vim.tbl_deep_extend(
                    "force",
                    client.config.settings.Lua, {
                        completion = {
                            callSnippet = "Replace",
                        },
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
        lsp.rust_analyzer = {
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

        -- call the setup lsp function for every lsp
        for lsp_name, config in pairs(lsp) do
            setup_lsp(lsp_name, config)
        end
    end,
}
