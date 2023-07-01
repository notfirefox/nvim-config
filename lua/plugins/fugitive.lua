return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            { "<Leader>p", "<Cmd>Git -c push.default=current push<CR>" },
            { "<Leader>F", "<Cmd>Git -c push.default=current push -f<CR>" },
            { "<Leader>P", "<Cmd>Git pull --autostash -pr<CR>" },
            { "<Leader>s", "<Cmd>0Git<CR>" },
            { "<Leader>l", "<Cmd>0Git log<CR>" },
        },
    },
}
