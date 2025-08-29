return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
            },
            auto_install = true,
            ignore_install = { "gitcommit", "git_rebase" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },
}
