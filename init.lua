
-- Basic Neovim options
vim.g.mapleader = " "
vim.opt.number = true               -- show line numbers
vim.opt.relativenumber = true       -- Relative line number
vim.opt.expandtab = true            -- use spaces instead of tabs
vim.opt.shiftwidth = 4              -- indent width
vim.opt.tabstop = 4                 -- tab width
vim.opt.termguicolors = true        -- enable colors

-- Load lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Plugins setup
require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = { enable = true },
            }
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup {
                options = { theme = "auto" }
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup{}
            vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                })
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details--
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
           require('lspconfig').lua_ls.setup({
               capabilities = require("cmp_nvim_lsp").default_capabilities(),
               settings = {
                   Lua = {
                       runtime = {
                           version = 'LuaJIT',
                       },
                       diagnostics = {
                           globals = { 'vim' },
                       },
                       workspace = {
                           library = vim.api.nvim_get_runtime_file("", true),
                           checkThirdParty = false,
                       },
                       telemetry = {
                           enable = false,
                       },
                   }
               }
           })
        end
    },
})
