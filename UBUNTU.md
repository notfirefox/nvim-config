# Ubuntu
> [!IMPORTANT]  
> This guide requires Ubuntu 24.04 or newer.

## Install Neovim

To be able to use add-apt-repository you may need to install `software-properties-common`.
```sh
sudo apt-get install software-properties-common
```

Run the following commands in order to install Neovim from the PPA repository.
```sh
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

## Install Tools
> [!NOTE]  
> This section needs to be expanded to contain installation instructions for Ubuntu.

### General
- fd-find
- ripgrep
- treesitter

### Bash
- bash-language-server
- shellcheck

### C/C++
- clangd

### Haskell
- haskell-language-server

### Lua
- lua-language-server
 
### Rust
- clippy
- rust-analyzer
- rustfmt

## Clone Config

Clone the Neovim config into `~/.config/nvim`.
```sh
git clone "https://github.com/notfirefox/nvim-config.git" ~/.config/nvim
```

## Sources 
- https://github.com/neovim/neovim/blob/master/INSTALL.md#ubuntu
