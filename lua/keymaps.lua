-- Space as mapleader
vim.g.mapleader = " "

-- escape alternative
vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- Move highlighted stuff
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Keeps cursor in the middle while scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Doesnt move cursor when hitting J
vim.keymap.set("n", "J", "mzJ'z")

-- Keeps search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clear highlights on search when pressing Esc in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
