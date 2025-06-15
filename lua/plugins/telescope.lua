return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        enabled = (vim.g.file_picker == "telescope"),
        version = "0.1.8",
        keys = {
            { "<Leader>b", "<Cmd>Telescope git_branches<CR>" },
            { "<Leader>e", "<Cmd>Telescope buffers<CR>" },
            { "<Leader>f", "<Cmd>Telescope find_files<CR>" },
            { "<Leader>g", "<Cmd>Telescope live_grep<CR>" },
            { "<Leader>h", "<Cmd>Telescope help_tags<CR>" },
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
