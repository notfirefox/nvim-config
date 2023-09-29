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
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

-- no wrapping
vim.opt.wrap = false

-- color column
vim.opt.colorcolumn = '80'
vim.cmd('highlight ColorColumn ctermbg=237')

-- restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
	group = vim.api.nvim_create_augroup('last_loc', { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- install plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- set leader key
vim.g.mapleader = ' '

-- setup plugins
require('lazy').setup('plugins')

-- set theme
vim.cmd('colorscheme gruvbox')
