-- ---------------------------------------------------------
                  -- https://github.com/ThePrimeagen/harpoon
-- ---------------------------------------------------------
require('harpoon').setup({
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead
                                               -- of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the
                                     -- terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates
                                      -- when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding
        --                      to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = true,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",

        menu = {
            width = vim.api.nvim_win_get_width(0) - 4,
        }
    }
})
-- ---------------------------------------------------------
                                                    -- Binds
local mark = require('harpoon.mark')
local ui   = require('harpoon.ui')

vim.keymap.set('n', '<leader>m', mark.add_file)
vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
