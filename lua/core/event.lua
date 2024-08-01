-- restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, "\"")
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- last theme group
local group = vim.api.nvim_create_augroup("last_theme", { clear = true })

-- load last theme
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    group = group,
    callback = function()
        local theme = vim.g.LAST_THEME
        theme = theme or "default"
        pcall(vim.cmd.colorscheme, theme)
    end,
})

-- store last theme
vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = function(params)
        vim.g.LAST_THEME = params.match
    end,
})
