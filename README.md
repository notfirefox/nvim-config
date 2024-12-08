# Neovim Config
<a href="https://neovim.io/" width="50px" align="right">
  <img src="./assets/nvim-logo.svg" width="50px" alt="Neovim Logo" align="right"/>
</a>

Simple Neovim Config

![C](https://img.shields.io/badge/c-%2300599C.svg?style=flat&logo=c&logoColor=white)
![C++](https://img.shields.io/badge/c++-%2300599C.svg?style=flat&logo=c%2B%2B&logoColor=white)
![Haskell](https://img.shields.io/badge/haskell-5e5086?style=flat&logo=haskell&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=flat&logo=lua&logoColor=white)
![Rust](https://img.shields.io/badge/rust-%23000000.svg?style=flat&logo=rust&logoColor=white)

<details>
  <summary>Preview</summary>
    <div align="center">
      <picture>
        <source media="(prefers-color-scheme: dark)" srcset="./assets/screenshot-dark.png" width="780px" alt="screenshot"/>
        <img src="./assets/screenshot-light.png" width="780px" alt="screenshot"/>
      </picture>
    </div>
</details>

## :clipboard: Requirements
- Neovim 0.9.5+
- Linux or macOS

## :package: Installation
Clone the repository into the config directory.
```sh
git clone "https://github.com/notfirefox/nvim-config.git" ~/.config/nvim
```

### Fedora
###### Base
```sh
dnf install fd-find neovim ripgrep
```
###### Bash
```sh
dnf install nodejs-bash-language-server shellcheck
```
###### C/C++
```sh
dnf install clang-tools-extra cmake gcc gcc-g++
```
###### Haskell
```sh
dnf -y copr enable petersen/haskell-language-server
```
```sh
dnf install haskell-language-server
```
###### Lua
```sh
dnf -y copr enable yorickpeterse/lua-language-server
```
```sh
dnf install lua-language-server
```
###### Rust
```sh
dnf install clippy rust-analyzer rustfmt
```

### Ubuntu
###### Base
```sh
apt install fd-find neovim ripgrep
```
###### Bash
```sh
apt install npm shellcheck
```
```sh
npm install -g --prefix ~/.local bash-language-server
```
###### C/C++
```sh
apt install build-essential clangd cmake
```
###### Haskell
```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
```sh
ghcup install ghc
```
```sh
ghcup install hls
```
###### Lua
```sh
apt install jq
```
```sh
ver=$(curl -s "https://api.github.com/repos/LuaLS/lua-language-server/releases/latest" | jq --raw-output '.tag_name')
```
```sh
curl -o ~/Downloads/luals.tar.gz \
  "https://github.com/LuaLS/lua-language-server/releases/download/$ver/lua-language-server-$ver-linux-x64.tar.gz"
```
```sh
mkdir -p ~/.local/share/luals
```
```sh
tar xf ~/Downloads/luals.tar.gz -C ~/.local/share/luals
```
```sh
ln -s ~/.local/share/luals/bin/lua-language-server ~/.local/bin/lua-language-server
```
###### Rust
```sh
apt install rustup
```
```sh
rustup default stable
```
```sh
rustup component add rust-analyzer
```

### macOS
###### Base
```sh
brew install fd neovim ripgrep
```
###### Bash
```sh
brew install bash-language-server shellcheck
```
###### C/C++
```sh
brew install cmake llvm
```
###### Haskell
```sh
brew install ghc haskell-language-server
```
###### Lua
```sh
brew install lua-language-server
```
###### Rust
```sh
brew install rust rust-analyzer
```
