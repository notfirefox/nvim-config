return {
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {
                '<leader>f',
                function()
                    require('telescope.builtin').find_files()
                end,
            },
            {
                '<leader>e',
                function()
                    require('telescope.builtin').buffers()
                end,
            }
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<esc>'] = 'close'
                    }
                },
                file_ignore_patterns = { 'build/' }
            }
        }
    },
}
