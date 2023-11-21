" ==========================================================
                   " https://github.com/lyokha/vim-xkbswitch
" ==========================================================
                                                   " General
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']

let g:XkbSwitchSkipIMappings =
        \ {'c'   : ['.', '>', ':', '{<CR>', '/*', '/*<CR>'],
        \  'cpp' : ['.', '>', ':', '{<CR>', '/*', '/*<CR>'],
        \  'md'  : ['jk'],
        \  'text'  : ['jk']}
