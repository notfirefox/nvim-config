return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {
            contrast = "hard",
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
        end,
    },
}
