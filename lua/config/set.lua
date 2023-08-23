-- color scheme
vim.cmd("colorscheme retrobox")

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undo settings
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

-- no wrapping
vim.opt.wrap = false

-- color column
vim.opt.colorcolumn = '80'
