# Neovim Config
Neovim Config for C, C++, Haskell and Rust

## Installation
Enable the Haskell language server repository.
```sh
dnf copr enable petersen/haskell-language-server
```
Install the required packages.
```sh
dnf install neovim fd-find ripgrep clang-tools-extra haskell-language-server rust-analyzer
```

Clone the repository into your your nvim config folder.
```sh
git clone "https://github.com/notfirefox/nvim-config.git" ~/.config/nvim
```
