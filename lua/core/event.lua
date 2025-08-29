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

-- configure language server
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
    callback = function(args)
        local bind = vim.keymap.set
        local opts = { buffer = args.buf }
        bind("n", "grn", vim.lsp.buf.rename, opts)
        bind("n", "grr", vim.lsp.buf.references, opts)
        bind("n", "gri", vim.lsp.buf.implementation, opts)
        bind("n", "gO", vim.lsp.buf.document_symbol, opts)
        bind({ "n", "v" }, "gra", vim.lsp.buf.code_action, opts)
        -- CTRL-S in Insert and Select mode maps to vim.lsp.buf.signature_help()
        -- [d and ]d move between diagnostics in the current buffer
        -- [D jumps to the first diagnostic, ]D jumps to the last

        local function supports_method(client, method, bufnr)
            if vim.fn.has("nvim-0.11") == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end

        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if supports_method(client, "textDocument/formatting", args.buf) then
            local utils = require("core.utils")
            utils.add_formatting_autocmd(args.buf, client.id)
            utils.create_clang_format()
        end
    end,
})
