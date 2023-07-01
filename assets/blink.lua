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
        keymap = { preset = "enter" },
    },
}
