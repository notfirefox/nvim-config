return {
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git" },
        keys = {
            {
                "<leader>C",
                function()
                    vim.cmd.Git("commit")
                end
            },
            {
                "<leader>p",
                function()
                    vim.cmd.Git("-c push.default=current push")
                end
            },
            {
                "<leader>P",
                function()
                    vim.cmd.Git("pull")
                end
            }
        }
    }
}
