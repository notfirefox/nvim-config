return {
  { 
    'nvim-telescope/telescope.nvim', version = '0.1.1', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>',
        function()
          require('telescope.builtin').find_files()
        end,
      },
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
