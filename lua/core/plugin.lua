-- install plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.o.runtimepath = lazypath .. "," .. vim.o.runtimepath

-- select the file picker by setting the string to one of those values:
-- * fzf
-- * snacks
vim.g.file_picker = "fzf"

-- setup plugins
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    rocks = {
        enabled = false,
    },
    ui = {
        icons = {
            cmd = "[cmd]",
            config = "[config]",
            event = "[event]",
            favorite = "[fav]",
            ft = "[ft]",
            init = "[init]",
            import = "[import]",
            keys = "[keys]",
            lazy = "",
            plugin = "[plugin]",
            runtime = "[rt]",
            require = "[require]",
            source = "[src]",
            start = "[start]",
            list = { "●" },
        },
    },
})
