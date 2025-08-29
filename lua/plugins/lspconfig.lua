return {
    "neovim/nvim-lspconfig",
    config = function()
        if vim.fn.has("nvim-0.11") == 0 then
            local lspconfig = require("lspconfig")
            local lsp_path = vim.fn.stdpath("config") .. "/after/lsp/"

            for name, type in vim.fs.dir(lsp_path) do
                if name:match("%.lua$") and type == "file" then
                    local lsp = name:gsub("%.lua$", "")
                    local config = dofile(lsp_path .. name)
                    local cmd =
                        lspconfig[lsp].document_config.default_config.cmd[1]

                    if vim.fn.executable(cmd) == 1 then
                        local blink = require("blink.cmp")
                        config.capabilities = blink.get_lsp_capabilities(
                            lspconfig[lsp].capabilities
                        )
                        lspconfig[lsp].setup(config)
                    end
                end
            end
        end

        if vim.fn.has("nvim-0.11") == 1 then
            vim.lsp.enable({ "clangd", "gopls", "lua_ls", "pylsp" })
        end
    end,
}
