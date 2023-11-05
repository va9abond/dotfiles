-- ---------------------------------------------------------
         -- https://github.com/nvim-telescope/telescope.nvim
-- ---------------------------------------------------------
local builtin  = require('telescope.builtin')
local actions  = require('telescope.actions')
local lactions = require('telescope.actions.layout')

require('telescope').setup({
  defaults = {
    picker = {
      find_files = {
        find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        mappings = {
          n = {
                                         -- change directory
            ["cd"] = function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              local dir = vim.fn.fnamemodify(selection.path, ":p:h")
              require("telescope.actions").close(prompt_bufnr)
              -- Depending on what you want put `cd`, `lcd`, `tcd`
              vim.cmd(string.format("silent cd %s", dir))
            end
          }
        }
      },
    },
                                            -- fzf extension
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }
})

require('telescope').load_extension('fzf')
-- ---------------------------------------------------------
                                                    -- Binds
vim.keymap.set('n', '<leader>fo',  builtin.oldfiles, { desc = '[?] Find recently opened files' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>?', builtin.builtin, { desc = 'View Telescope Builtin' })
