return {
    {
        "tpope/vim-fugitive",
        lazy = false,
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
                    vim.cmd.Git("-c push.default=current push")
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
