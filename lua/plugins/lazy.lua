-- [[ Bootstrap Lazy ]] 
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
        "vague-theme/vague.nvim",
        priority = 1000 ,
        config = function()
            require("vague").setup({
                transparent = true
            })
            vim.cmd.colorscheme("vague")
        end,
    },

    { -- [[ Trouble ]]
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble"
    },

    { -- [[ LuaLine ]]
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = { theme = "tomorrow_night" },
                sections = {
                    lualine_d = {
                        { "pipeline" },
                    },
                },
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
        },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
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
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "clangd",
                    "gopls",
                    "pyright",
                    "ts_ls"
                }
            },
            dependencies = {
                {
                    "mason-org/mason.nvim",
                    opts = {
                        ui = {
                            icons = {
                                package_installed = "✓",
                                package_pending = "➜",
                                package_uninstalled = "✗"
                            }
                        }
                    },
                },
                {
                    "neovim/nvim-lspconfig",
                    dependencies = {
                        'saghen/blink.cmp',
                    },
                    config = function()
                        local capabilities = require("blink.cmp").get_lsp_capabilities()
                        vim.lsp.config("lua_ls", { capabilities = capabilities })
                    end,
                },
            },
        },
    },

    { -- [[ LSP notifications ]]
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = function()
            require("fidget").setup({})
        end,
    },

    { -- [[ Completion Engine]]
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        opts = {
            keymap = { preset = 'default' },
            appearance = { nerd_font_variant = "mono" },
        },
        signature = { enabled = true }
    },
})
