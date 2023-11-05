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
-- Clear 'jk' bind
vim.cmd [[imapclear]]
vim.keymap.set('i', '<C-d>', '<del>')
-- ---------------------------------------------------------
                                              -- Spell check
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
