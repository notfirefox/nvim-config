# Neovim Config
Neovim Config for various programming languages.

## Supported Languages
- Bash
- Haskell
- Lua
- Rust

## Installation

> [!IMPORTANT]
> This section only covers the installation process for Fedora Linux.

Enable the Haskell language server repository.
```sh
dnf copr enable petersen/haskell-language-server
```

Enable the Lua language server repository.
```sh
dnf copr enable yorickpeterse/lua-language-server
```

Install the required packages.
```sh
dnf install neovim \
            fd-find \
            ripgrep \
            nodejs-bash-language-server \
            haskell-language-server \
            lua-language-server \
            clippy rust-analyzer \
            rustfmt
```

Clone the repository into your your nvim config folder.
```sh
git clone "https://github.com/notfirefox/nvim-config.git" ~/.config/nvim
```
