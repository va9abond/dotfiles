-- TODO: vim-sanegx
-- ----------------------------------------------
-- Bootstraping lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- ----------------------------------------------
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- ----------------------------------------------
local plugins = {

    { 'nvim-lua/plenary.nvim' },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        -- dependencies = { 'sheerun/vim-polyglot',
            -- config = function() require('plugins.vim-polyglot') end
            -- opts = { vim.g['polyglot_disabled'] = 'autoindent' }
        -- },
        config = function()
            require('plugins.treesitter')
        end
    },

    {
        'williamboman/mason.nvim',
        config = function()
            require('plugins.mason')
        end
    },
    -- ----------------------------------------------
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        config = function() require('plugins.telescope') end
    },
    -- ----------------------------------------------
    -- Colorschemes
    { 'RRethy/nvim-base16' },

    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('plugins.gruvbox')
        end
    },

    { 'folke/tokyonight.nvim' },

    -- { 'nanotech/jellybeans.vim' , lazy = false, priority = 1000, config = function() require('plugins.jellybeans') end },

    { 'kabouzeid/nvim-jellybeans', lazy = false, priority = 1000, dependencies = { 'rktjmp/lush.nvim' } },
    { 'Shatur/neovim-ayu',         lazy = false, priority = 1000 },

    { 'nekonako/xresources-nvim' },

    { 'RishabhRD/nvim-rdark' },

    { 'mhartington/oceanic-next' },

    { 'bluz71/vim-moonfly-colors' },
    -- ----------------------------------------------
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },

    {
        'ThePrimeagen/harpoon'
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require('plugins.nvimtree') end
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = { "SmiteshP/nvim-navic" },
        config = function()
            require('plugins.barbecue')
        end
    },

    {
        'stevearc/aerial.nvim',
        config = function()
            require('plugins.aerial')
        end
    },

    -- { 'preservim/tagbar' },

    { 'liuchengxu/vista.vim' },

    {
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },

    {
        "stevearc/overseer.nvim",
        commit = "3047ede61cc1308069ad1184c0d447ebee92d749",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
                bindings = { ["q"] = function() vim.cmd("OverseerClose") end },
            },
        },
    },

    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('plugins.hop')
        end
    },

    {
        'RRethy/vim-illuminate',
        -- opts = { delay = 200 }
    },

    {
        'christoomey/vim-tmux-navigator'
    },
-- ----------------------------------------------
    -- LSP

    { 'williamboman/mason-lspconfig.nvim' },

    {
        'neovim/nvim-lspconfig',
        -- opts = { autoformat = false },
        config = function()
            require('plugins.lsp.lspconfig')
        end
    },

    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',

        },
        config = function()
            require('plugins.lsp.nvim-cmp')
        end
    },

    {
        'onsails/lspkind.nvim',
        config = function()
            require('plugins.lsp.lspkind')
        end,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('plugins.nvim-autopairs')
        end,
    },

    {
        'ray-x/navigator.lua',
        dependencies = { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
        config = function() require('plugins.lsp.navigator') end
    },

    {
        'p00f/clangd_extensions.nvim', config = function() require('plugins.clangd_extensions') end
    },

-- ----------------------------------------------
}
-- ----------------------------------------------
local opts = {}
-- ----------------------------------------------
require("lazy").setup(plugins, opts)
