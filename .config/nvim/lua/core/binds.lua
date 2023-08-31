local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = false })
end


vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
map('i', 'jk', '<ESC>')

vim.keymap.set('n', '<leader>h', '<esc>:nohlsearch<cr>', { noremap = true, silent = true })

map('n', '<Tab>', '<CMD>tabnext<CR>')
map('n', '<S-Tab>', '<CMD>tabprev<CR>')

-- Fix * (Keep cursor position, don't move to next match)
map('n', '*', '*N')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- split window
map('n', '<Bslash>v', '<CMD>vsplit<CR>')
map('n', '<Bslash>x', '<CMD>split<CR>')

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- binds_NvimTree
map('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
map('i', '<C-n>', '<cmd>NvimTreeToggle<cr>')

-- the greatest remap ever, thx ThePrimeagen and asbjornHaland
map({ 'v', 'n' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])

-- Map tmux navigator
map({ 'n', 'i' }, '<C-h>', '<CMD>TmuxNavigateLeft<CR>')
map({ 'n', 'i' }, '<C-j>', '<CMD>TmuxNavigateDown<CR>')
map({ 'n', 'i' }, '<C-k>', '<CMD>TmuxNavigateUp<CR>')
map({ 'n', 'i' }, '<C-l>', '<CMD>TmuxNavigateRight<CR>')

-- Tagbar
-- vim.keymap.set('n', '<Bslash>t', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', '<Bslash>t', '<cmd>Vista!!<CR>')

-- Compiler.nvim
-- Open compiler
vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<S-F6>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
