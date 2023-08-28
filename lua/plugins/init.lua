return {
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
}
