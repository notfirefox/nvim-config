-- automatically install packer
local ensure_packer = function()
  local path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    local url = 'https://github.com/wbthomason/packer.nvim'
    vim.fn.system({ 'git', 'clone', '--depth', '1', url, path })
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- setup packer and plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- basic features
  use 'windwp/nvim-autopairs'
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-lua/plenary.nvim' -- required by telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', }
  use 'windwp/nvim-ts-autotag'
  --- smart features
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
