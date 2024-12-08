return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        -- variables
        local luasnip = require("luasnip")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        -- setup autopairs for cmp
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        -- setup nvim-cmp
        cmp.setup {
            completion = {
                completeopt = vim.o.completeopt,
            },
            enabled = function()
                local context = require("cmp.config.context")
                local get_option_val = vim.api.nvim_get_option_value

                local b = false
                b = b or (get_option_val("buftype", { buf = 0 }) == "prompt")
                b = b or (vim.fn.reg_recording() ~= "")
                b = b or (vim.fn.reg_executing() ~= "")
                b = b or (context.in_treesitter_capture("comment"))
                b = b or (context.in_syntax_group("Comment"))
                return not b
            end,
            formatting = {
                fields = { "abbr", "kind" },
                format = function(_, vim_item)
                    vim_item.menu = ""
                    return vim_item
                end
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
            },
        }
    end,
}
