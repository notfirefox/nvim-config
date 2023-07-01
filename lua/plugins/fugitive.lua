return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            -- push to current branch
            {
                "<Leader>p",
                function()
                    vim.cmd.Git("-c push.default=current push")
                end,
            },
            -- force push to current branch
            {
                "<Leader>F",
                function()
                    vim.cmd.Git("-c push.default=current push --force")
                end,
            },
            -- pull
            {
                "<Leader>P",
                function()
                    vim.cmd.Git("pull --autostash --rebase --prune")
                end,
            },
            -- stage and status
            {
                "<Leader>s",
                function()
                    vim.cmd("0Git")
                end,
            },
            -- commit log
            {
                "<Leader>l",
                function()
                    vim.cmd("0Git log")
                end,
            },
        },
    },
}
