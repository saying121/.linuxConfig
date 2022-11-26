" 状态栏
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" set statusline=%<%F%=%y%m%r%h%w%{&ff}\[%{&fenc}]0x%02B@%040h#%n\(%3l/%3L,%3c\|%3v\)%3p%%
set laststatus=2                            "显示状态栏信息
set statusline=%6*\%{StatuslineGit()}\
set statusline+=%1*\%<%.50F\                    "显示文件名和文件路径 (%<应该可以去掉)
" set statusline+=%7*\%{StatusDiagnostic()}\
set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*                "显示光标前文本所占总文本的比例
" hi User6 cterm=none ctermfg=35 "ctermbg=0
hi User6 guifg=Olivedrab
" hi User1 cterm=none ctermfg=25 "ctermbg=0
hi User1 guifg=blue
" hi User7 cterm=none ctermfg=45 "ctermbg=0
" hi User7 guifg=red
" hi User2 cterm=none ctermfg=208 "ctermbg=0
hi User2 guifg=Turquoise
" hi User3 cterm=none ctermfg=169 "ctermbg=0
hi User3 guifg=Darkgray
" hi User4 cterm=none ctermfg=100 "ctermbg=0
hi User4 guifg=Cyan
" hi User5 cterm=none ctermfg=green "ctermbg=0
hi User5 guifg=green
" %number *\ ... \%*和对应，后面设置的颜色样式会应用到中的部分hi User<number>hi User<number>%number *\ ... \%*...
" %< 如果状态行过长，在何处换行
" %F 完整文件路径名
" %.50F 文件路径名长度不超过50，超过则进行缩写
" %= 在此之后的内容，显示在状态栏上时右对齐
" %y 文件类型
" %m 如果缓冲区已修改则表示为[+]
" %r 如果缓冲区为只读则表示为[RO]
" %h 如果为帮助显示为缓冲区[Help]
" %w 如果为预览窗口则显示为[Preview]
" %{&ff} 显示文件系统类型
" %{&fenc} 显示文件编码
" %l 光标所在行数
" %L 文件总行数
" %c 光标所在列数
" %p 当前行数占总行数的的百分比
" cterm：设置粗体，斜体，正体;ctermfg：前景色;ctermbg：背景色

