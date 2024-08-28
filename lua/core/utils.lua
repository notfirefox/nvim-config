local utils = {}

-- lsp submodule
utils.lsp = {}

-- for replacing certain <C-x>... keymaps.
function utils.lsp.feedkeys(keys)
    local keys_str = vim.api.nvim_replace_termcodes(keys, true, false, true)
    vim.api.nvim_feedkeys(keys_str, "n", true)
end

-- whether the completion menu is open
function utils.lsp.pumvisible()
    return tonumber(vim.fn.pumvisible()) ~= 0
end

-- enable auto completion
function utils.lsp.enable_auto_completion(bufnr, client_id)
    local opts = {
        autotrigger = true,
        convert = function()
            return { menu = "" }
        end,
    }
    vim.lsp.completion.enable(true, client_id, bufnr, opts)
end

-- handle cr key
function utils.lsp.on_cr()
    if utils.lsp.pumvisible() then
        utils.lsp.feedkeys("<C-y>")
    else
        utils.lsp.feedkeys("<CR>")
    end
end

-- add formatting auto command
function utils.lsp.add_formatting_autocmd(bufnr, client_id)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, id = client_id })
        end
    })
end

-- create clang format file
function utils.lsp.create_clang_format()
    local file = vim.fn.expand("~/.clang-format")
    if not vim.uv.fs_stat(file) then
        local text = { "---", "BasedOnStyle: LLVM", "IndentWidth: 4" }
        vim.fn.writefile(text, file)
    end
end

return utils
