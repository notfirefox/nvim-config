return {
    {
        -- TODO: Update lua line configuration
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "gruvbox",
                icons_enabled = false,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    { 'branch', icons_enabled = true },
                    'diff',
                    'diagnostics'
                },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        }
    }
}
