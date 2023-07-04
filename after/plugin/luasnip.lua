-- variables
local luasnip = require('luasnip')
local s = luasnip.s

-- nodes
local i = luasnip.insert_node
local t = luasnip.text_node

-- snippets for cmake
luasnip.add_snippets('all', {
  s('executable', {
    t('cmake_minimum_required(VERSION '),
    i(1, '3.20'),
    t({ ')', '' }),
    t({ '', 'project(' }),
    i(2, 'project-name'),
    t(')'),
    t({ '', 'set(CMAKE_EXPORT_COMPILE_COMMANDS ON)', '' }),
    t({ '', 'add_executable(main)' }),
    t({ '', 'target_sources(main PRIVATE ' }),
    i(3, 'src/main.c'),
    t({ ')', '' })
  }),
  s('version', {
    t('target_compile_features(main PUBLIC cxx_std_'),
    i(1, '17'),
    t({ ')', '' }),
    t({ 'set_target_properties(main PROPERTIES CXX_EXTENSIONS OFF)', '' })
  })
})

-- snippets for c
luasnip.add_snippets('c', {
  s('main', {
    t('int main(int argc, const char *argv[]) {'),
    t({ '', '\t' }),
    i(0),
    t({ '', '', '\treturn 0;' }),
    t({ '', '}' }),
  }),
})

-- snippets for cpp
luasnip.add_snippets('cpp', {
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
})
