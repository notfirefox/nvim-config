return {
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.7",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>b",
                function()
                    require("telescope.builtin").git_branches()
                end,
            },
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
            {
                "<leader>h",
                function()
                    require("telescope.builtin").help_tags()
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
