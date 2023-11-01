vim.g.tex_flavor = "latex"
vim.opt.conceallevel = 1
vim.g.tex_conceal = "abdmg"

vim.g.vimtex_quickfix_enabled = 0
vim.g.vimtex_quickfix_mode = 2
vim.g.vimtex_quickfix_open_on_warning = 0

vim.g.vimtex_indent_enabled = 1
vim.g.vimtex_syntax_enabled = 0
vim.g.vimtex_complete_enabled = 0

vim.g['vimtex_log_ignore'] = ({
  'Underfull',
  'Overfull',
  'specifier changed to',
  'Token not allowed in a PDF string',
})

vim.g.vimtex_view_method = "zathura"
-- vim.g['vimtex_context_pdf_viewer'] = 'okular'
-- vim.g.vimtex_view_method = "okular"
-- vim.g.vimtex_view_general_viewer = "okular"
-- vim.g.vimtex_view_general_options = ({ "--unique file:@pdf\#src:@line@tex" })
-- vim.cmd(
    -- "let g:vimtex_toc_config = {'layer_status': {'label':0, 'include':0}, 'show_help':0}"
-- )
vim.g.tex_flavor = "latex"
-- vim.g.vimtex_compiler_method = 'latexrun'
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



-- vim.cmd([[
--     " autocmd Filetype tex setl spell spelllang=ru,en
--     " autocmd Filetype tex setl updatetime=250
-- ]])
