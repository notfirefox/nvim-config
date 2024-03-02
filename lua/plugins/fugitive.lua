return {
    {
        "tpope/vim-fugitive",
        keys = {
            {
                "<leader>gc",
                function()
                    vim.cmd.Git("commit")
                end
            },
            {
                "<leader>gp",
                function()
                    vim.cmd.Git("push")
                end
            },
            {
                "<leader>gP",
                function()
                    vim.cmd.Git("pull")
                end
            }
        }
    }
}
