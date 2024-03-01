return {
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>e",
                function()
                    require("telescope.builtin").buffers()
                end,
            },
            {
                "<leader>f",
                function()
                    require("telescope.builtin").find_files({ hidden = true })
                end,
            },
            {
                "<leader>g",
                function()
                    require("telescope.builtin").live_grep()
                end,
            },
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = "close"
                    }
                },
                file_ignore_patterns = { ".git/" }
            }
        }
    },
}
