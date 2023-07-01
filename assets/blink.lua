-- experimental blink config
return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
            menu = {
                draw = {
                    columns = {
                        { "label" },
                        { "kind" },
                    },
                    components = {
                        label = {
                            text = function(ctx)
                                return ctx.label
                            end,
                        },
                    },
                    treesitter = { "lsp" },
                },
            },
        },
        snippets = {
            expand = function(snippet)
                local session = nil
                if vim.snippet.active() then
                    session = vim.snippet._session
                end
                vim.snippet.expand(snippet)
                if session then
                    vim.snippet._session = session
                end
            end,
        },
        keymap = { preset = "enter" },
    },
}
