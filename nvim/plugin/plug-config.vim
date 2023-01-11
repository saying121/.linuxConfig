scriptencoding utf-8

" --------------------------------------------------------------------------------
" translator
" set at plugin lazy
" nnoremap <M-y> <Plug>TranslateW
" vnoremap <M-y> <Plug>TranslateWV
" Available: 'bing', 'google', 'haici', 'iciba'(expired), 'sdcv', 'trans', 'youdao'
let g:translator_default_engines=['google','haici']
" """ Configuration example
" " Echo translation in the cmdline
" nmap <silent> <Leader>t <Plug>Translate
" vmap <silent> <Leader>t <Plug>TranslateV
" " Display translation in a window
" nmap <silent> <Leader>w <Plug>TranslateW
" vmap <silent> <Leader>w <Plug>TranslateWV
" " Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR
" vmap <silent> <Leader>r <Plug>TranslateRV
" " Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX
