return {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
    version = "1.*",
    opts = {
        cmdline = { enabled = false },
        completion = {
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
                },
            },
        },
        fuzzy = { implementation = "lua" },
        keymap = { preset = "enter" },
        snippets = { preset = "luasnip" },
    },
}
