-- variables
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- setup telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close
      }
    },
    file_ignore_patterns = { '^./build/' }
  },
}

vim.keymap.set('n', '<Space>', builtin.find_files)
