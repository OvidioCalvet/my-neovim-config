# Minimal Neovim Configuration

## Introduction

**About**
Welcome to my personal neovim configuration. The idea of this project was to maximize my efficiency
and productivty within the terminal. I was exposed to neovim by a popular creator by the name of the
primeagen. I was fascinated by how quickly he could navigate and edit text files and I wanted exactly
that. I took the time to learn how to use vim motions and got relatively good at them. 

Here we are today with an extremely minimal and fast configuration that I curated with the vague colorscheme
which I find really nice on the eyes especially for long programming sessions. The main principle is simple, I
want to have only exactly what I need to get the job done. A fzf for files, a colorscheme, harpoon for quick
file navigation for files I am constantly switching between, quality of life settings for clean movement 
around files, and a barebones minimal lsp that I can turn on and off when needed.

**Plugins**
Below is a list of the plugins that I use for my configuration

- Lazy  (plugin manager)
- Vague (colorscheme)
- Lualine (conext line for vim)
- Treesitter (language parser)
- Neoscroll (smoother vim scrolling)
- Telescope (file fzf)
- Harpoon (bookmark files)
- Lazydev (enhanced lua ls)
- Mason (LSP manager)
- blink (completion engine)

**File Structure**
```
nvim
├── init.lua
├── lua
│   ├── keymaps.lua
│   ├── options.lua
│   └── plugins
│       ├── keymaps.lua
│       └── lazy.lua
└── README.md
```

## Install

**SSH**
```bash
git clone git@github.com:OvidioCalvet/my-neovim-config.git
```

**HTTP**
```bash
git clone https://github.com/OvidioCalvet/my-neovim-config.git
```

## Uninstall

```bash
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
```
