return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "haskell",
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
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
