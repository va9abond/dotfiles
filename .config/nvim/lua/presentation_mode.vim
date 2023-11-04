" presentation mode
noremap <Left> :silent bp<CR> :redraw!<CR>
noremap <Right> :silent bn<CR> :redraw!<CR>
nmap <F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<CR>
nmap <F2> :call DisplayPresentationBoundaries()<CR>
nmap <F3> :call FindExecuteCommand()<CR>

" jump to slides
nmap <F9> :call JumpFirstBuffer()<CR> :redraw!<CR>
nmap <F10> :call JumpSecondToLastBuffer()<CR> :redraw!<CR>
nmap <F11> :call JumpLastBuffer()<CR> :redraw!<CR>

" makes Ascii art font
nmap <leader>af :.!toilet -w 200 -f standard<CR>
nmap <leader>as :.!toilet -w 200 -f small<CR>
" makes Ascii border
nmap <leader>ab :.!toilet -w 200 -f term -F border<CR>
" capitalize titles
nmap <leader>ct :.!capitalize-title -<CR>
vnoremap <leader>ct :.!capitalize-title -<CR>

" AsciiDoc preview
" nmap <leader>v :w !asciidoc-view -<CR><CR>




function! JumpFirstBuffer()
  execute "buffer 1"
endfunction

function! JumpSecondToLastBuffer()
  execute "buffer " . (len(Buffers()) - 1)
endfunction

function! JumpLastBuffer()
  execute "buffer " . len(Buffers())
endfunction

function! Buffers()
  let l:buffers = filter(range(1, bufnr('$')), 'bufexists(v:val)')
  return l:buffers
endfunction

let g:presentationBoundsDisplayed = 0
function! DisplayPresentationBoundaries()
  if g:presentationBoundsDisplayed
    match
    set colorcolumn=0
    let g:presentationBoundsDisplayed = 0
  else
    highlight lastoflines ctermbg=darkred guibg=darkred
    match lastoflines /\%23l/
    set colorcolumn=80
    let g:presentationBoundsDisplayed = 1
  endif
endfunction

function! FindExecuteCommand()
  let line = search('\S*!'.'!:.*')
  if line > 0
    let command = substitute(getline(line), "\S*!"."!:*", "", "")
    execute "silent !". command
    execute "normal gg0"
    redraw
  endif
endfunction
