" 当前行高亮
set cursorline
augroup CursorLine
    autocmd!
    autocmd WinEnter,InsertLeave * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
augroup END

" 恢复光标位置
augroup RecoverCursor
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

" 写入自动删除行末空格
augroup blank
    autocmd!
    autocmd BufWrite * :%s/\s\+$//e
    " autocmd BufWrite *.vim  :%s/\s\+$//e
augroup END

" 自动创建代码块
" augroup views
"     autocmd!
"     autocmd BufWrite * mkview
"     autocmd BufWinLeave * mkview
"     autocmd BufRead * silent loadview
" augroup END

augroup File
    autocmd!
    autocmd BufWritePost *.sh silent !chmod +x %
    autocmd BufNewFile *.sh silent 0r ~/.linuxConfig/nvim/viml/template/shell.txt | normal G
    autocmd BufNewFile *.py silent 0r ~/.linuxConfig/nvim/viml/template/python3.txt| normal G
augroup END
