return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
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
            {
                "<leader>s",
                function()
                    vim.cmd("0Git")
                end
            }
        }
    }
}
