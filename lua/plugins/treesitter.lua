return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "haskell",
                "html",
                "lua",
                "markdown",
                "query",
                "rust",
                "vim",
                "vimdoc",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        },
    },
}
