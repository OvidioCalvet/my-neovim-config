-- [[ Bootstrap Lazy ]] 
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Lazy load plugins ]]
require("lazy").setup({

    { -- [[ Colorscheme ]]
        { "vague-theme/vague.nvim",
            priority = 1000 ,
            config = function()
                require("vague").setup({
                    transparent = true
                })
                vim.cmd.colorscheme("vague")
            end,
        }
    },

    { -- [[ LuaLine ]]
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = { theme = "tomorrow_night" }
            })
        end,
    },

    { -- [[ Treesitter ]] 
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "html",
                    "css",
                    "lua",
                    "python",
                    "javascript",
                    "typescript",
                    "cpp",
                    "go",
                    "rust",
                    "yaml",
                    "bash"
                },
                auto_install = true,
                sync_install = false,
                highlight = { enable = true },
            })
        end,
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                    pcall(function()
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end)
                end,
            })
        end,
    },

    { -- [[ Smooth Scrolling ]]
        "karb94/neoscroll.nvim",
        opts = {}
    },

    { -- [[ Telescope ]]
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        branch = "master",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    vertical = { width = 0.7, },
                },
                preview = { treesitter = true, },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        },
    },

    { -- [[ Harpoon ]]
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        config = true
    },

    { -- [[ Lazydev ]]
        "folke/lazydev.nvim",
        lazy = false,
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "lazy.lua" }
            },
        },
    },

    { -- [[ Minimal LSP ]]
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        lazy = false,
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = true,
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        ensure_installed = {
                            "lua_ls", "clangd", "pyright", "gopls",
                            "cssls", "html", "tailwindcss", "ts_ls", "eslint"
                        },
                        automatic_enable = true
                    })
                end,
            },
            "folke/lazydev.nvim",
        },
    },

    { -- [[ Completion Engine]]
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        opts = {
            keymap = { preset = 'default' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
    }
})
