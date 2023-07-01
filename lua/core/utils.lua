local M = {}

-- add formatting auto command
function M.add_formatting_autocmd(bufnr, client_id)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, id = client_id })
        end,
    })
end

-- create clang format file
function M.create_clang_format()
    local file = vim.fn.expand("~/.clang-format")
    if not vim.uv.fs_stat(file) then
        local text = {
            "---",
            "BasedOnStyle: LLVM",
            "UseTab: Always",
            "IndentWidth: 8",
            "TabWidth: 8",
        }
        vim.fn.writefile(text, file)
    end
end

return M
