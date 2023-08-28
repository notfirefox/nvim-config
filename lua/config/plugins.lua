-- automatically install plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require('lazy').setup({
  'windwp/nvim-autopairs',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 
    'nvim-telescope/telescope.nvim', version = '0.1.1', 
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
})
