# Neovim Config
Neovim Config for Haskell and Rust

## Installation

> [!IMPORTANT]
> This section only covers the installation process for Fedora Linux.

Enable the Haskell language server repository.
```sh
dnf copr enable petersen/haskell-language-server
```
Install the required packages.
```sh
dnf install neovim \
            fd-find \
            ripgrep \
            haskell-language-server \
            clippy rust-analyzer \
            rustfmt
```

Clone the repository into your your nvim config folder.
```sh
git clone "https://github.com/notfirefox/nvim-config.git" ~/.config/nvim
```
