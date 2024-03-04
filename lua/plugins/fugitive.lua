return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            -- pushing
            {
                "<leader>p",
                function()
                    vim.cmd.Git("-c push.default=current push")
                end
            },
            -- pulling
            {
                "<leader>P",
                function()
                    vim.cmd.Git("pull")
                end
            },
            -- staging
            {
                "<leader>s",
                function()
                    vim.cmd("0Git")
                end
            },
            -- logging
            {
                "<leader>l",
                function()
                    vim.cmd.Git("log")
                end
            },
        }
    }
}
