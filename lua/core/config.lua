-- line numbers
vim.o.number = true

-- hide status line
vim.o.laststatus = 1

-- undo settings
vim.o.undofile = true

-- no wrapping
vim.o.wrap = false

-- popup menu height
vim.o.pumheight = 10

-- complete options
vim.o.completeopt = "menu,menuone,noinsert"

-- color column
vim.o.colorcolumn = "80"

-- disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- set leader key
vim.g.mapleader = vim.keycode("<Space>")

-- include loading status
function CustomRulerFormat()
    return "%l,%c%V%=" .. (vim.g.loading_status or "%P")
end

-- set ruler format
vim.o.rulerformat = "%{%v:lua.CustomRulerFormat()%}"
