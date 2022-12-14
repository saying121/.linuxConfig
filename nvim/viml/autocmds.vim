scriptencoding utf-8

" 当前行高亮
set cursorline
augroup CursorLine
    autocmd!
    autocmd WinEnter,InsertLeave * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
augroup END

augroup RecoverCursor
    autocmd!
    " 恢复光标位置
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
    " 光标修改二选一
    autocmd VimLeave * set guicursor=n:ver50-ncvCursor
    " autocmd VimLeave * set guicursor=a:ver1
augroup END

" 写入自动删除行末空格
augroup blank
    autocmd!
    autocmd BufWrite * :%s/\s\+$//e
augroup END

" 自动创建视图
" augroup views
"     autocmd!
"     autocmd BufWrite * mkview
"     autocmd BufWinLeave * mkview
"     autocmd BufRead * silent loadview
" augroup END

augroup File
    autocmd!
    autocmd BufWritePost *.sh,*.py,*.lua silent !chmod +x %
    " 读取模板
    autocmd BufNewFile *.sh silent 0r ~/.config/nvim/viml/template/shell.txt | normal G
    autocmd BufNewFile *.py silent 0r ~/.config/nvim/viml/template/python3.txt| normal G
    autocmd BufNewFile *.html silent 0r ~/.config/nvim/viml/template/html.txt| normal Gdd8G
    autocmd BufNewFile *.vim silent 0r ~/.config/nvim/viml/template/vim.txt| normal G
augroup END

" 自动展开文件
augroup markdown
    autocmd!
    autocmd VimEnter,BufReadPost * normal zR
augroup END
