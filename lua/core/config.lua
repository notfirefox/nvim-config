-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undo settings
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

-- no wrapping
vim.opt.wrap = false

-- visualize tabs
vim.opt.list = true
vim.opt.listchars = "tab:>-"

-- popup menu height
vim.opt.pumheight = 16

-- color column
vim.opt.colorcolumn = "80"

-- set leader key
vim.g.mapleader = " "
