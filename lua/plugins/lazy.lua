-- [[ Lazy ]] 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
        { "vague2k/vague.nvim",
            priority = 1000 ,
            config = function()
                require("vague").setup({
                    transparent = true
                })
                vim.cmd.colorscheme("vague")
            end,
        }
    },

    { -- [[ Treesitter ]] 
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                modules = {},
                ensure_installed = { "html", "css", "lua", "python", "javascript", "cpp" },
                ignore_install = {},
                auto_install = false,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    { -- [[ Telescope ]]
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim'}
    },

    { -- [[ Harpoon ]]
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        config = true
    },

    { -- [[ Minimal LSP Setup ]]
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                    "html",
                    "cssls",
                },
            })

            local lspconfig = require("lspconfig")

            local servers = {
                pyright = {},
                clangd = {},
                html = {},
                cssls = {},
            }

            for name, opts in pairs(servers) do
                lspconfig[name].setup(opts)
            end
        end,
    },
})
