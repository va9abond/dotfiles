-- ---------------------------------------------------------
                                                      -- Set
vim.opt.colorcolumn = "60"
vim.opt.textwidth = 70
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)
vim.opt.linebreak = true
-- ---------------------------------------------------------
                                                    -- Binds
vim.keymap.set({'i', 'n'}, '<C-Enter>', '<cmd>VimtexCompile<cr>')
vim.keymap.set('n', '<C-c>', '<cmd>VimtexClean<cr>')
vim.keymap.set('n', '<Bslash>t', '<cmd>VimtexTocToggle<cr>')
-- ---------------------------------------------------------
                                              -- Spell check
vim.opt.spelllang = 'en_us,ru_ru'
vim.opt.spell = true
