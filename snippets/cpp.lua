-- variables
local luasnip = require('luasnip')
local s = luasnip.s

-- nodes
local i = luasnip.insert_node
local t = luasnip.text_node

-- snippets for cpp
return {
  s('main', {
    t('int main(int argc, const char *argv[]) {'),
    t({ '', '\t' }),
    i(0),
    t({ '', '', '\treturn 0;' }),
    t({ '', '}' }),
  }),
  s('cout', {
    t('std::cout << "'),
    i(1),
    t({ '" << std::endl;', '' }),
    i(2)
  }),
  s('cerr', {
    t('std::cerr << "'),
    i(1),
    t({ '" << std::endl;', '' }),
    i(2)
  })
}
