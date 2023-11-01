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
        config = function() require('plugins.treesitter') end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        build = ':TSUpdate',
    },

    {
        'williamboman/mason.nvim',
        config = function() require('plugins.mason') end
    },
-- ----------------------------------------------
    -- Debug Adapter Protocol (DAP)

    { 'mfussenegger/nvim-dap', },

    { 'rcarriga/nvim-dap-ui', },

    { 'theHamsta/nvim-dap-virtual-text' },

    { 'nvim-telescope/telescope-dap.nvim' },
-- ----------------------------------------------
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        config = function() require('plugins.telescope') end,
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-lua/plenary.nvim'
        }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    -- {
    --     "ibhagwan/fzf-lua",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = function()
    --         require('plugins.fzf_lua')
    --     end
    -- },

-- ----------------------------------------------
    -- Colorschemes
    { 'RRethy/nvim-base16' },

    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        priority = 1000,
        config = function() require('plugins.gruvbox') end
    },

    { 'folke/tokyonight.nvim' },

    {
        'kabouzeid/nvim-jellybeans',
        lazy = false, priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' }
    },

    {
        'Shatur/neovim-ayu',
        lazy = false, priority = 1000
    },

-- ----------------------------------------------
    -- { 'vim-scripts/DrawIt' },

    { 'lyokha/vim-xkbswitch' },

    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function() require('Comment').setup() end
    },

    { 'tpope/vim-surround' },

    {
        'ThePrimeagen/harpoon',
        config = function() require('plugins.harpoon') end
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
        config = function() require('plugins.barbecue') end
    },

    { 'liuchengxu/vista.vim' }, -- alts: preservim/tagbar, stevearc/aerial.nvim

    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function() require('plugins.hop') end
    },

    { 'christoomey/vim-tmux-navigator' },

    {
        'folke/zen-mode.nvim',
        config = function() require('plugins.zen') end
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end
    },

    {
        'lervag/vimtex',
        config = function() require('plugins.vimtex') end
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns') end
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

    -- {
    --     'windwp/nvim-autopairs',
    --     -- event = "InsertEnter",
    --     config = function()
    --         require('plugins.nvim-autopairs')
    --     end,
    -- },

    {
        'stevearc/dressing.nvim',
        config = function() require('plugins.lsp.dressing') end
    },

    {
        'p00f/clangd_extensions.nvim',
        config = function() require('plugins.clangd_extensions') end
    },

-- ----------------------------------------------
}
-- ----------------------------------------------
local opts = {}
-- ----------------------------------------------
require("lazy").setup(plugins, opts)
