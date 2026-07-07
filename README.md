<div align="center">
    <br>
    <header>
        <h3>
            <b>dotfiles.nvim</b>
        </h3>
    </header>
    <br>
    <br>
</div>

<table>
  <tr>
      <td><img width=100% height="1200" alt="image" src="https://github.com/user-attachments/assets/7e542482-7f02-454d-bfed-e6c6b2648980" /></td>
      <td><img width=100% height="1200" alt="2026-07-06-205328_hyprshot" src="https://github.com/user-attachments/assets/576ab071-32dd-4b53-b704-312146e03a39" /></td>
  </tr>
</table>

<br>

### Introduction

Welcome to my personal neovim configuration. The idea of this project was to maximize my efficiency
and productivty within the terminal. I was exposed to neovim by the primeagen. I was fascinated by 
how quickly he could navigate and edit text files and I wanted that. I took the time to learn 
how to use vim motions and got relatively good at them. 

Here we are today with an extremely minimal and fast configuration that I curated with the vague colorscheme
which I find really nice on the eyes especially for long programming sessions. The main principle is simple, I
want to have only exactly what I need to get the job done. A fzf for files, a colorscheme, harpoon for quick
file navigation for files I am constantly switching between, quality of life settings for clean movement 
around files, and a barebones minimal lsp that I can turn on and off when needed.

### Plugins

- Lazy  (plugin manager)
- Vague (colorscheme)
- Lualine (conext line for vim)
- Neoscroll (smoother vim scrolling)
- Telescope (file fzf)
- Harpoon (bookmark files)
- Lazydev (enhanced lua ls)
- Mason (LSP manager)
- Fidget (lsp notifications)
- blink (completion engine)

### File Structure
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

### Install

**SSH**
```bash
git clone git@github.com:OvidioCalvet/my-neovim-config.git ~/.config/nvim
```

**HTTP**
```bash
git clone https://github.com/OvidioCalvet/my-neovim-config.git ~/.config/nvim
```

### Uninstall

```bash
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
```
