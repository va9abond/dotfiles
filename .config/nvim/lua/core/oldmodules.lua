-- ----------------------------------------------
-- Bootstraping lazy.nvim
-- ----------------------------------------------
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

-- ----------------------------------------------
    -- Colors
-- ----------------------------------------------

    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        priority = 1000,
        config = function() require('plugins.gruvbox') end
    },

-- ----------------------------------------------



    -- { 'liuchengxu/vista.vim' }, -- alts: preservim/tagbar, stevearc/aerial.nvim


    -- { 'christoomey/vim-tmux-navigator' },


    -- {
    --     'nvim-lualine/lualine.nvim',
    --     config = function() require('plugins.lualine') end
    -- },

    -- {
    --     'lervag/vimtex',
    --     config = function() require('plugins.vimtex') end
    -- },

    -- {
    --     'lewis6991/gitsigns.nvim',
    --     config = function() require('plugins.gitsigns') end
    -- },

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
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- 'hrsh7th/cmp-vsnip',
            -- 'hrsh7th/vim-vsnip',

        },
        config = function()
            require('plugins.lsp.nvim-cmp')
        end
    },

    {
        'L3MON4D3/LuaSnip',
        version = "v.2*",
        build = "make install_jsregexp",
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function()
            require('plugins.luasnip')
        end
    },

    { 'saadparwaiz1/cmp_luasnip'},

    { 'rafamadriz/friendly-snippets' },


    -- {
    --     'windwp/nvim-autopairs',
    --     event = "InsertEnter",
    --     config = function()
    --         require('plugins.nvim-autopairs')
    --     end,
    -- },

    -- {
    --     'stevearc/dressing.nvim',
    --     config = function() require('plugins.lsp.dressing') end
    -- },

-- ----------------------------------------------
}
-- ----------------------------------------------
local opts = {}
-- ----------------------------------------------
require("lazy").setup(plugins, opts)

