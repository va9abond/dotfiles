-- ----------------------------------------------
local builtin  = require('telescope.builtin')
local actions  = require('telescope.actions')
local lactions = require('telescope.actions.layout')
-- ----------------------------------------------
local my_hook  = function(filepath, bufnr, opts)
    local is_image = function(filepath)
        local image_extensions = { 'png', 'jpg' } -- Supported image formats
        local split_path = vim.split(filepath:lower(), '.', { plain = true })
        local extension = split_path[#split_path]
        return vim.tbl_contains(image_extensions, extension)
    end
    if is_image(filepath) then
        local term = vim.api.nvim_open_term(bufnr, {})
        local function send_output(_, data, _)
            for _, d in ipairs(data) do
                vim.api.nvim_chan_send(term, d .. '\r\n')
            end
        end
        vim.fn.jobstart(
            {
                'catimg', filepath -- Terminal image viewer command
            },
            { on_stdout = send_output, stdout_buffered = true, pty = true })
    else
        require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
    end
end
-- ----------------------------------------------
require('telescope').setup
{
    defaults = {
        preview = {
            mime_hook = my_hook
        },
        mappings = {
            i = {
                ['<C-Bslash>'] = "which_key",
            },
        },
        picker = {
            find_files = {
                find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
                mappings = {
                    n = {
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
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            }
        }
    }
}


-- [Tj DeVries, nvim-kickstart]
vim.keymap.set('n', '<leader>?',  builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>f?', builtin.builtin, {})

require('telescope').load_extension('fzf')
