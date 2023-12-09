vim.g.tex_flavor = "latex"
vim.opt.conceallevel = 0
vim.g.tex_conceal = "abdmg"

vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_quickfix_mode = 2
vim.g.vimtex_quickfix_open_on_warning = 0

vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_complete_enabled = 1

vim.g['vimtex_log_ignore'] = ({
  'Underfull',
  'Overfull',
  'specifier changed to',
  'Token not allowed in a PDF string',
})

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_silent = 0
vim.g.vimtex_compiler_latexmk = {
    options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape',
    }
}
