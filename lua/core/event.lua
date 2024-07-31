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

-- load color scheme
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    group = vim.api.nvim_create_augroup("load_theme", { clear = true }),
    callback = function()
        local theme = vim.g.COLOR_SCHEME
        if theme ~= nil and theme ~= "" then
            pcall(vim.cmd.colorscheme, theme)
        end
    end,
})

-- store color scheme
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("store_theme", { clear = true }),
    callback = function(params)
        vim.g.COLOR_SCHEME = params.match
    end,
})
