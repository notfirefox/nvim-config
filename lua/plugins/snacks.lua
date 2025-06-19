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
            layouts = {
                vertical = {
                    layout = {
                        backdrop = true,
                        width = 0.8,
                        height = 0.8,
                        min_width = 0,
                        min_height = 0,
                    },
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
