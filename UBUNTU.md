# Ubuntu
This guide describes how to setup this Neovim config on Ubuntu for basic C/C++ support.

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
Usually a lot of other tools would be required for this config to function properly.
In the guide however we will only cover what is strictly needed for autocompletion in C/C++.

For C/C++ language support, we need to install the `clangd` language server.
```sh
sudo apt install clangd
```

## Clone Config

Clone the Neovim config into `~/.config/nvim`.
```sh
git clone "https://github.com/notfirefox/nvim-config.git" ~/.config/nvim
```

## Disable Features
Some features that are not strictly necessary for basic autocompletion may require additional
software, that was not covered in the [Install Tools](https://github.com/notfirefox/nvim-config/blob/main/UBUNTU.md#install-tools) section.

Run the following commands in order to remove some plugins that are not necessary.
```sh
rm ~/.config/nvim/lua/plugins/fugitive.lua
rm ~/.config/nvim/lua/plugins/telescope.lua
rm ~/.config/nvim/lua/plugins/treesitter.lua
```

## Fix Formatting
`clang-format` by default assumes that we want to use 2 spaces for indentation, whereas my config is designed for 4 spaces. Therefore we need to override the default `clang` format.
```sh
echo -e "---\nBasedOnStyle: LLVM\nIndentWidth: 4\n" > ~/.clang-format
```

## Sources 
- https://github.com/neovim/neovim/blob/master/INSTALL.md#ubuntu
