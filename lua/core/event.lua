-- restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
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
        local theme = vim.g.LAST_THEME or "default"
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

-- set tab to four spaces for certain languages
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "rust" },
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
        vim.bo.smartindent = true
    end,
})

-- update loading status
vim.api.nvim_create_autocmd("LspProgress", {
    group = vim.api.nvim_create_augroup("lsp_progress", { clear = true }),
    callback = function(ev)
        local spinner = {
            "⠋",
            "⠙",
            "⠹",
            "⠸",
            "⠼",
            "⠴",
            "⠦",
            "⠧",
            "⠇",
            "⠏",
        }
        if ev.data.params.value.kind == "end" then
            vim.g.loading_status = nil
        else
            vim.g.loading_status =
                spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
        end
        vim.cmd.redrawstatus()
    end,
})

-- configure language server
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method("textDocument/formatting", args.buf) then
            local utils = require("core.utils")
            utils.add_formatting_autocmd(args.buf, client.id)
            utils.create_clang_format()
        end
    end,
})
