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
    pattern = { "haskell", "lua", "rust" },
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
        vim.bo.smartindent = true
    end
})

-- configure language server
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        local bind = vim.keymap.set
        local opts = { buffer = args.buf }
        local utils = require("core.utils")

        if client.supports_method("textDocument/codeAction") then
            bind("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end

        if client.supports_method("textDocument/hover") then
            bind("n", "K", vim.lsp.buf.hover, opts)
        end

        if client.supports_method("textDocument/formatting")
        then
            utils.add_formatting_autocmd(args.buf, client.id)
            utils.create_clang_format()
        end

        if client.supports_method("textDocument/rename") then
            bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end
    end,
})
