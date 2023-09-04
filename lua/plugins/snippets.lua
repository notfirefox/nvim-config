return {
  -- TODO: Move snippets out of this repository
  'L3MON4D3/LuaSnip',
  config = function()
    local loader = require('luasnip.loaders.from_vscode')
    loader.load({ paths = { "./json/snippets/" } })
  end,
}
