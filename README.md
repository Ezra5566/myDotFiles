# .dotfiles

This repository contains my personal dotfiles, including preconfigured settings for Neovim, tailored specifically for TypeScript, Rust, Zig, Go development. It includes a curated selection of plugins, key mappings, and customizations to enhance productivity and streamline coding workflows.

### Vim re-maps
[CHEATSHEET.md](CHEATSHEET.md)

### Getting started
```shell
stow --target ~/.config .
```

### Preview
![preview-rose-pine](rose-pine.png "rose-pine theme")

|                     |                                                                           |
|---------------------|---------------------------------------------------------------------------|
|Shell:               |[zsh](https://www.zsh.org/) + [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)|
|Editor:              |[neovim](https://github.com/neovim/neovim)                                 |
|Terminal:            |[alacritty](https://github.com/alacritty/alacritty)                        |
|Terminal-Multiplexer:|[zellij](https://github.com/zellij-org/zellij)                             |

**Optional**, but highly recommended:

* [fzf](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [jq](https://github.com/stedolan/jq)
* [nvim kickstarter](https://github.com/nvim-lua/kickstart.nvim)

## Themes

|                                                         |                                                 |
|---------------------------------------------------------|-------------------------------------------------|
|[catppuccin](https://github.com/catppuccin.nvim)   |<img src="images/catpuccin.png" alt="tokyonight theme" width="330" height="250" title="tokyonight theme">  |
|[gruvbox](https://github.com/ellisonleao/gruvbox.nvim)   |<img src="images/gruvbox.png" alt="gruvbox theme" width="330" height="250" title="gruvbox theme">  |

## Switch theme

To swich the theme in a more simple way, we are using a simple bash script by just calling this alias.

```shell
colorscheme tokyonight
```

## Features

- `lsp-zero` manage [language servers](https://github.com/VonHeikemen/lsp-zero.nvim)
- `telescope.nvim` a highly extendable [fuzzy finder](https://github.com/nvim-telescope/telescope.nvim)
- `nvim-treesitter` [parsing library](https://github.com/nvim-treesitter/nvim-treesitter)
- `theprimeagen/harpoon` [buffer navigation](https://github.com/ThePrimeagen/harpoon)
- `undotree` visualizes the [undo history](https://github.com/mbbill/undotree)
- `lualine.nvim` fast and easy to configure Neovim [statusline](https://github.com/nvim-lualine/lualine.nvim)
