-- ---------------------------------------------------------
                       -- https://github.com/folke/lazy.nvim
-- ---------------------------------------------------------
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- ---------------------------------------------------------
local plugins = {
                                                -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            "nvim-tree/nvim-web-devicons"
        }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

-- ---------------------------------------------------------
                                                      -- LSP
    {
        'williamboman/mason.nvim',
        config = function() require('mason').setup() end,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        config = function() require('mason-lspconfig').setup() end,
    },

    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        }
    },

                                           -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", lazy = false },
            { 'hrsh7th/cmp-buffer', lazy = false },
            { 'hrsh7th/cmp-path', lazy = false },
            { 'hrsh7th/cmp-cmdline', lazy = false },
            { 'hrsh7th/cmp-nvim-lua', lazy = false },
            { 'onsails/lspkind.nvim', lazy = false },
                                                 -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    },

-- ---------------------------------------------------------
                                               -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile" },
        build = ':TSUpdate'
    },

    { 'nvim-treesitter/playground' },
    -- { 'nvim-treesitter/nvim-treesitter-context' },

-- ---------------------------------------------------------
                             -- Debug Adapter Protocol (DAP)
-- ---------------------------------------------------------
                                                      -- Git
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },

-- ---------------------------------------------------------
                                                -- Expanding
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true
    },

    { 'tpope/vim-vinegar' },

    { 'ThePrimeagen/harpoon' },

    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        lazy = false,
        config = function() require('Comment').setup() end
    },

    { 'phaazon/hop.nvim', branch = 'v2' },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },

    { 'mbbill/undotree' },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },

    -- { 'christoomey/vim-tmux-navigator' },

    { 'lervag/vimtex' },

    -- { 'lyokha/vim-xkbswitch' },

-- ---------------------------------------------------------
                                                     --  GUI
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require('barbecue').setup() end
    },

    { 'folke/zen-mode.nvim' },

    { 'nvim-lualine/lualine.nvim' },

-- ---------------------------------------------------------
                                                   -- Colors
    {
        'ellisonleao/gruvbox.nvim',
        lazy = false, priority = 1000,
        config = function() require('gruvbox') end
    },

    { 'rose-pine/neovim', name = 'rose-pine' },

    {
        'kabouzeid/nvim-jellybeans', name = 'jbns',
        lazy = false, priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' }
    },

    {
        'metalelf0/jellybeans-nvim',
        lazy = false, priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' }
    },

-- ---------------------------------------------------------
                                                 -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- {
    --     'toppair/peek.nvim',
    --     build = 'deno task --quiet build:fast',
    --     config = function()
    --         require('peek').setup({
    --             auto_load = false,
    --             syntax = false,
    --             theme = 'dark',
    --             app = { 'chromium', '--new-window' },
    --             vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {}),
    --             vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    --         })
    --     end
    -- },

-- ---------------------------------------------------------
    { 'nvim-lua/plenary.nvim' },
}
-- ---------------------------------------------------------
local opts = {}
-- ---------------------------------------------------------
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
-- ---------------------------------------------------------
require("lazy").setup(plugins, opts)
