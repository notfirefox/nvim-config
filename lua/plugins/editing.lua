return {
  { 
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  }
}
