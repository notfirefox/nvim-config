return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls", -- requires npm, shellcheck
                "clangd",
                -- "hls", -- requires ghcup
                "lua_ls",
                "rust_analyzer"
            },
        })

        -- variables
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- disable diagnostic signs
        vim.diagnostic.config({
            signs = false
        })

        -- bash
        lspconfig.bashls.setup({
            capabilities = capabilities,
        })

        -- clangd
        lspconfig.clangd.setup({
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
        })

        -- haskell
        lspconfig.hls.setup({
            capabilities = capabilities,
            settings = {
                haskell = {
                    formattingProvider = "fourmolu"
                }
            }
        })

        -- lua
        lspconfig.lua_ls.setup({
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
        })

        -- rust
        lspconfig.rust_analyzer.setup({
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
        })
    end,
}
