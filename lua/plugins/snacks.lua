return {
    "folke/snacks.nvim",
    enabled = (vim.g.file_picker == "snacks"),
    priority = 1000,
    lazy = false,
    opts = {
        picker = {
            enabled = true,
            icons = {
                files = { enabled = false },
                git = { enabled = false },
            },
            layout = {
                preset = function()
                    return vim.o.columns >= 120 and "telescope"
                        or "telescope_no_preview"
                end,
            },
            layouts = {
                telescope = {
                    reverse = true,
                    layout = {
                        box = "horizontal",
                        backdrop = false,
                        width = 0.8,
                        height = 0.9,
                        border = "none",
                        {
                            box = "vertical",
                            {
                                win = "list",
                                title = " Results ",
                                title_pos = "center",
                                border = "rounded",
                            },
                            {
                                win = "input",
                                height = 1,
                                border = "rounded",
                                title = "{title} {flags}",
                                title_pos = "center",
                            },
                        },
                        {
                            win = "preview",
                            title = "{preview:Preview}",
                            width = 0.5,
                            border = "rounded",
                            title_pos = "center",
                        },
                    },
                },
                telescope_no_preview = {
                    preset = "telescope",
                    preview = false,
                },
            },
            prompt = "> ",
            ui_select = false,
            win = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                    },
                },
            },
        },
    },
    keys = {
        { "<Leader>b", "<Cmd>lua Snacks.picker.git_branches()<CR>" },
        { "<Leader>e", "<Cmd>lua Snacks.picker.buffers()<CR>" },
        { "<Leader>f", "<Cmd>lua Snacks.picker.files()<CR>" },
        { "<Leader>g", "<Cmd>lua Snacks.picker.grep()<CR>" },
        { "<Leader>h", "<Cmd>lua Snacks.picker.help()<CR>" },
        { "<Leader>H", "<Cmd>lua Snacks.picker.highlights()<CR>" },
    },
}
