return {
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<Leader>b",
                function()
                    require("telescope.builtin").git_branches()
                end,
            },
            {
                "<Leader>e",
                function()
                    require("telescope.builtin").buffers()
                end,
            },
            {
                "<Leader>f",
                function()
                    require("telescope.builtin").find_files({ hidden = true })
                end,
            },
            {
                "<Leader>g",
                function()
                    require("telescope.builtin").live_grep()
                end,
            },
            {
                "<Leader>h",
                function()
                    require("telescope.builtin").help_tags()
                end,
            },
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = "close",
                    },
                },
                file_ignore_patterns = { ".git/" },
            },
        },
    },
}
