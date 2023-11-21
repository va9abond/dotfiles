-- ---------------------------------------------------------
local function map(m,k,v)
    vim.keymap.set(m,k,v, {noremap = true, silent = false})
end
-- ---------------------------------------------------------
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- ---------------------------------------------------------
                                        -- Insert mode binds
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', '<C-d>', '<del>')
-- ---------------------------------------------------------
                                  -- Command-line mode binds
vim.keymap.set('c', '<C-h>', '<Left>')
vim.keymap.set('c', '<C-l>', '<Right>')
vim.keymap.set('c', '<C-j>', '<S-Left>')
vim.keymap.set('c', '<C-k>', '<S-Right>')
-- ---------------------------------------------------------
                                        -- Buffes navigation
map('n', '<C-n>', '<cmd>bnext<cr>')
map('n', '<C-p>', '<cmd>bprevious<cr>')
map('n', '<leader>t', '<cmd>enew<cr>')
map('n', '<leader>x', '<cmd>bd<cr>')
map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>Q', '<cmd>q!<cr>')
-- ---------------------------------------------------------
                           -- Inserts blank line below/above
map('n', '<CR>', 'o<ESC>')
map('n', '<S-Enter>', 'O<ESC>')
-- ---------------------------------------------------------
                                             -- Split window
map('n', '<Bslash>v', '<CMD>vsplit<CR>')
map('n', '<Bslash>x', '<CMD>split<CR>')
-- ---------------------------------------------------------
-- Use operator pending mode to visually select the whole
-- buffer e.g. dA = delete buffer ALL, yA = copy whole buffer
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')
-- ---------------------------------------------------------
map({'v', 'n'}, '<leader>y', [["+y]])
map('n',        '<leader>Y', [["+Y]])
map({'n', 'v'}, '<leader>d', [["+d]])
map('n',        '<leader>D', [["+D]])
map({'n', 'v'}, '<leader>p', [["+p]])
map('n',        '<leader>P', [["+P]])

-- map("x", "p", )
-- ---------------------------------------------------------
                                      -- Where do they lead?
map('n', 'x', '"_x')
-- ---------------------------------------------------------
                                    -- Splits navigation
map({ 'n', 'i' }, '<C-h>', '<C-w><C-h>')
map({ 'n', 'i' }, '<C-j>', '<C-w><C-j>')
map({ 'n', 'i' }, '<C-k>', '<C-w><C-k>')
map({ 'n', 'i' }, '<C-l>', '<C-w><C-l>')
-- ---------------------------------------------------------
-- Goes to the first line above/below that isn't whitespace
--
-- ---------------------------------------------------------
                                                   -- tagbar
-- vim.keymap.set('n', '<Bslash>t', '<cmd>AerialToggle!<CR>')
-- vim.keymap.set('n', '<Bslash>t', '<cmd>Vista!!<CR>')
-- ---------------------------------------------------------
                                            -- Zooming panes
vim.keymap.set('n', '<leader>z', '<C-w>|')
vim.keymap.set('n', '<leader>=', '<C-w>=')
-- ---------------------------------------------------------
                                             -- Panes resize
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -5<cr>')
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +5<cr>')
vim.keymap.set('n', '<C-Up>', '<cmd>res -5<cr>')
vim.keymap.set('n', '<C-Down>', '<cmd>res +5<cr>')
-- ---------------------------------------------------------
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- ---------------------------------------------------------
                             -- Fix * (Keep cursor position,
                             --    don't move to next match)
map('n', '*', '*N')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
-- ---------------------------------------------------------
                                            -- Aligning text
map('n', '<leader>>', '<cmd>.right 60<cr>')
map('n', '<leader><', '<cmd>.left 0<cr>')
-- ---------------------------------------------------------
                                         -- Thx ThePrimeagen
                                         -- Open netrw
vim.keymap.set('n', '<leader><leader>', vim.cmd.Ex)
                                   -- Move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
                          -- Halp page scroll with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- ---------------------------------------------------------
                                                 -- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
-- ---------------------------------------------------------
                                                  -- Trouble
vim.keymap.set("n", "<space>x", function() require("trouble").toggle() end)
vim.keymap.set("n", "<space>q", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<space>l", function() require("trouble").toggle("loclist") end)
-- ---------------------------------------------------------
-- Do not include white space characters when using $ in visual mode;
           -- see https://vi.stackexchange.com/q/12607/15292
                        -- Go to start or end of line easier
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "g_")
-- ---------------------------------------------------------
  -- Continuous visual shifting (does not exit Visual mode),
             -- `gv` means to reselect previous visual area;
                -- see https://superuser.com/q/310417/736190
vim.keymap.set("x", "<", "<gv")

vim.keymap.set("x", ">", ">gv")
-- ---------------------------------------------------------
             -- Reselect the text that has just been pasted;
         -- see https://stackoverflow.com/a/4317090/6064933
vim.keymap.set("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", {
  expr = true,
  desc = "reselect last pasted area",
})
-- ---------------------------------------------------------
                                 -- Change working directory
-- :cd <mydirectory>
-- :cd -  // chande current to home dir
-- :pwd // print current dir
-- ---------------------------------------------------------
                         -- Use Esc to quit builtin terminal
vim.keymap.set("t", "<Esc>", '<C-\\><C-n>')
vim.keymap.set('n', 'q<leader>', 'q:')
-- vim.keymap.set({'c', 't'}, '<Esc>', '<cmd>q<cr>')
-- vim.cmd[[cnoremap <Esc> <c]]
-- ---------------------------------------------------------
    -- Change text without putting it into the vim register;
            -- see https://stackoverflow.com/q/54255/6064933
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("n", "cc", '"_cc')
vim.keymap.set("x", "c", '"_c')
-- ---------------------------------------------------------
          -- Replace visual selection with text in register,
                           -- but not clogging the register;
    -- see also https://stackoverflow.com/q/10723700/6064933
vim.keymap.set("x", "p", '"_c<Esc>p')
-- ---------------------------------------------------------
                                        -- clandg_extensions
vim.keymap.set("n", "<C-i>", "<cmd>ClangdSymbolInfo<cr>")
-- ---------------------------------------------------------
-- Thanks a lot to:
                --  ThePrimeagen,
                --  jdhao,
                --  Tj DeVries
                --  asbjornHaland,
                --  sdaschner
