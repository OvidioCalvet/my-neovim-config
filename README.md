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
      <td><img width=100% height="1200" alt="2026-07-06-205328_hyprshot" src="https://github.com/user-attachments/assets/576ab071-32dd-4b53-b704-312146e03a39" /></td>
      <td><img width=100% height="1200" alt="image" src="https://github.com/user-attachments/assets/7e542482-7f02-454d-bfed-e6c6b2648980" /></td>
  </tr>
</table>

<br>

### Introduction

Welcome to my personal neovim configuration! It was my freshman year of college where I first discoverd the world
of linux and the power within the terminal. I came across a video from The Primeagen, a very well known creator who
loves neovim. I watched how fast he could edit files and the depth of knowledge he had within his own editor and I was 
really inspired to do the same. I decided to have a raspberry pi running with neovim installed and from class I would
ssh into my pi and practice the vim motions with `:Tutor` and had an absolute blast. I struggled a lot at first but
quickly after a few weeks I picked up on the patterns and eventually it became second nature and then just preferance.

Here we are today, I have been vimming like a madman for over a year now and haven't looked back since. In case you
were wondering no I do not use my pi anymore lol. I have linux laptop running arch btw.

I present an extremely minimal and fast configuration that I curated with a colorscheme inspired by The Primeagen
which I find really nice on the eyes especially for long programming sessions. The essential idea is simple, I
want to have only exactly what I need to get the job done. A fzf for files, a clean colorscheme, quick file
navigation for common files used in a codebase, quality of life settings for clean movement around files, and 
a clean efficient lsp to enhance productivity within a codebase.

Take a look below where I have a list of the plugins that I use to achieve this goal, the file structure
for your ease of personal configuration, and a quick install and uninstall command to get started.

<br>

<div align="center">
<table>
<tr>
<td valign="top">

### Plugins

<div align="left">

- Lazy  (plugin manager)
- Vague (colorscheme)
- Lualine (context line for vim)
- Neoscroll (smoother vim scrolling)
- Telescope (file fzf)
- Harpoon (bookmark files)
- Lazydev (enhanced lua ls)
- Mason (LSP manager)
- Fidget (lsp notifications)
- blink (completion engine)

</div>

</td>
<td valign="top">

### File Structure

<div align="left">

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

</div>

</td>
</tr>
</table>
</div>

<br>

### Install

**SSH**
```bash
git clone git@github.com:OvidioCalvet/my-neovim-config.git ~/.config/nvim
```

**HTTP**
```bash
git clone https://github.com/OvidioCalvet/my-neovim-config.git ~/.config/nvim
```

<br>

### Uninstall

```bash
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
```

<br>

