local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = false })
end


vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local function is_vimwiki()
    if vim.bo.filetype == "vimwiki" then
        print('wiki')
    else
        print("now wiki")
    end
end

-- vim.api.nvim_create_autocmd()
map('i', 'jk', '<ESC>')
map('i', 'ол', 'ол')

vim.keymap.set('n', '<Bslash>h', '<cmd>nohlsearch<cr>', { noremap = true, silent = true })

-- Fix * (Keep cursor position, don't move to next match)
map('n', '*', '*N')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- buffes navigation [sdaschner]
map('n', '<leader>t',  '<cmd>enew<cr>')
-- map('n', '<leader>bn', '<cmd>bnext<cr>')
-- map('n', '<leader>bp', '<cmd>bprevious<cr>')
map('n', '<C-]>', '<cmd>bnext<cr>')
map('n', '<C-[>', '<cmd>bprevious<cr>')
map('n', '<leader>x', '<cmd>bd<cr>')
map('n', '<leader>X', '<cmd>bd!<cr>')
-- map('n', '<leader>bl', '<cmd>ls<cr>')

-- Quickly save the current buffer or all buffers
-- map('n', '<leader>w', '<CMD>update<CR>')
-- map('n', '<leader>s', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- inserts blank line below/above
-- https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
map('n', '<CR>', 'o<ESC>')
map('n', '<S-Enter>', 'O<ESC>')

-- move block of lines [sdaschner]
-- map({'n', 'v'}, '<Space>j', '<cmd>m +1<cr>')
-- map({'n', 'v'}, '<Space>k', '<cmd>m -2<cr>')
-- nnoremap <C-j> :m +1<CR>
-- nnoremap <C-k> :m -2<CR>
-- inoremap <C-j> <Esc>:m +1<CR>gi
-- inoremap <C-k> <Esc>:m -2<CR>gi
-- vnoremap <C-j> :m '>+1<CR>gvgv
-- vnoremap <C-k> :m '<-2<CR>gvgv

-- split window
map('n', '<Bslash>v', '<CMD>vsplit<CR>')
map('n', '<Bslash>x', '<CMD>split<CR>')

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- binds NvimTree
map({'n', 'i'}, '<C-n>', '<cmd>NvimTreeToggle<cr>')
-- map('i', '<C-n>', '<cmd>NvimTreeToggle<cr>')

-- the greatest remap ever, thx [ThePrimeagen, asbjornHaland, sdaschner]
map({'v', 'n'}, '<leader>y', [["+y]])
map('n',        '<leader>Y', [["+Y]])
map({'n', 'v'}, '<leader>d', [["+d]])
map('n',        '<leader>D', [["+D]])
map({'n', 'v'}, '<leader>p', [["+p]])
map('n',        '<leader>P', [["+P]])

-- Map tmux navigator
map({ 'n', 'i' }, '<C-h>', '<CMD>TmuxNavigateLeft<CR>')
map({ 'n', 'i' }, '<C-j>', '<CMD>TmuxNavigateDown<CR>')
map({ 'n', 'i' }, '<C-k>', '<CMD>TmuxNavigateUp<CR>')
map({ 'n', 'i' }, '<C-l>', '<CMD>TmuxNavigateRight<CR>')

-- Tagbar
-- vim.keymap.set('n', '<Bslash>t', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', '<Bslash>t', '<cmd>Vista!!<CR>')

-- Zooming panes
vim.keymap.set('n', '<leader>z', '<C-w>|')
vim.keymap.set('n', '<leader>Z', '<C-w>=')

-- Panes resize
-- vim.keymap.set('n', '+', '<Nop>', { silent = true })
-- vim.keymap.set('n', '-', '<Nop>', { silent = true })
vim.keymap.set('n', '+', '<cmd>res +5<cr>')
vim.keymap.set('n', '-', '<cmd>res -5<cr>')

-- Other [Tj DeVries, nvim-kickstart]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
