return {
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
