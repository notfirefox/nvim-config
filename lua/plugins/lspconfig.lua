return {
    "neovim/nvim-lspconfig",
    config = function()
        -- customize diagnostics
        vim.diagnostic.config({
            signs = false,
            virtual_text = true,
        })

        -- configure clangd language server
        vim.lsp.config("clangd", {
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

        -- configure lua language server
        vim.lsp.config("lua_ls", {
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if
                    vim.uv.fs_stat(path .. "/.luarc.json")
                    or vim.uv.fs_stat(path .. "/.luarc.jsonc")
                then
                    return
                end
                client.config.settings.Lua =
                    vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        completion = {
                            callSnippet = "Replace",
                        },
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                "${3rd}/luv/library",
                            },
                        },
                    })
            end,
            settings = {
                Lua = {},
            },
        })

        -- configure rust language server
        vim.lsp.config("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                    },
                    diagnostics = {
                        enable = false,
                    },
                },
            },
        })

        -- enable language servers
        vim.lsp.enable({
            "clangd",
            "lua_ls",
            "pylsp",
            "rust_analyzer",
        })
    end,
}
