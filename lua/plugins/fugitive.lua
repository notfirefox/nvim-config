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
            {
                "<leader>F",
                function()
                    vim.cmd.Git("-c push.default=current push --force")
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
                    vim.cmd("0Git log")
                end
            },
        },
        config = function(_)
            function CustomStatusLine()
                local branch = "[" .. vim.fn.FugitiveHead() .. "]"
                return branch .. " %<%f %h%m%r%=%-14.(%l,%c%V%) %P"
            end

            vim.opt.statusline = "%!luaeval('CustomStatusLine()')"
        end,
    }
}
