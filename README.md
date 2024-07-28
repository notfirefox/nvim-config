<h1 align="center">Neovim Config</h1>

<p align="center">
  <a href="https://www.open-std.org/jtc1/sc22/wg14/"><img src="https://img.shields.io/badge/c-%2300599C.svg?style=flat&logo=c&logoColor=white"></a>
  <a href="https://isocpp.org/"><img src="https://img.shields.io/badge/c++-%2300599C.svg?style=flat&logo=c%2B%2B&logoColor=white"></a>
  <a href="https://www.lua.org/"><img src="https://img.shields.io/badge/lua-%232C2D72.svg?style=flat&logo=lua&logoColor=white"></a>
  <a href="https://www.rust-lang.org/"><img src="https://img.shields.io/badge/rust-%23000000.svg?style=flat&logo=rust&logoColor=white"></a>
  <a href="https://www.gnu.org/software/bash/"><img src="https://img.shields.io/badge/shell_script-%23121011.svg?style=flat&logo=gnu-bash&logoColor=white"></a>
</p>

<p align="center"><i>Simple Neovim Config</i></p>

<h4 align="center">
  <a href="#features">Features</a>
  ·
  <a href="#requirements">Requirements</a>
  ·
  <a href="#installation">Installation</a>
</h4>

## Features
- Autocompletion using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Fuzzy Finder using [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Git Integration using [vim-fugitive](https://github.com/tpope/vim-fugitive)

## Requirements 
Get [Homebrew](https://brew.sh/) to install the latest developer tools.

## Installation
Clone the repository into the config directory.
```sh
git clone "https://github.com/notfirefox/nvim-config.git" ~/.config/nvim
```

Use `brew` to install the required dependencies.
```sh
brew bundle --file ~/.config/nvim/Brewfile
```
