return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            -- push to current branch
            {
                "<leader>p",
                function()
                    vim.cmd.Git("-c push.default=current push")
                end
            },
            -- force push to current branch
            {
                "<leader>F",
                function()
                    vim.cmd.Git("-c push.default=current push --force")
                end
            },
            -- pull
            {
                "<leader>P",
                function()
                    vim.cmd.Git("pull --autostash --rebase --prune")
                end
            },
            -- stage and status
            {
                "<leader>s",
                function()
                    vim.cmd("0Git")
                end
            },
            -- commit log
            {
                "<leader>l",
                function()
                    vim.cmd("0Git log")
                end
            },
        },
        config = function()
            function CustomStatusLine()
                local branch = "[" .. vim.fn.FugitiveHead() .. "]"
                return branch .. " %<%f %h%m%r%=%-14.(%l,%c%V%) %P"
            end

            vim.o.statusline = "%!luaeval('CustomStatusLine()')"
        end,
    }
}
