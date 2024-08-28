local utils = {}

-- lsp submodule
utils.lsp = {}

-- add formatting auto command
function utils.lsp.add_formatting_autocmd(bufnr, id)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, id = id })
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
