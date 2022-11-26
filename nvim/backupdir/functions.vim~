" F4编译运行
nnoremap <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype=='c'
        if !isdirectory('cbuild')
            execute "! mkdir cbuild"
        endif
        exec "! gcc % -o cbuild/%<"
        exec "term time ./cbuild/%<"
    elseif &filetype=='cpp'
        if !isdirectory('c++build')
            execute "! mkdir c++build"
        endif
        exec "! g++ % -o c++build/%<"
        exec "term time ./build/%<"
    elseif &filetype=='java'
        if !isdirectory('javabuild')
            execute "! mkdir javabuild"
        endif
        exec "! javac -d ./javabuild/ %"
        exec "term time java -cp ./javabuild/ %<"
    elseif &filetype=='sh'
        :term time bash %
    elseif &filetype=='python'
        exec "term time python3 %"
    elseif &filetype=='lua'
        exec "term time lua %"
    elseif &filetype=='go'
        exec "! go build %<"
        exec "term time go run %"
    endif
endfunc

" F3编译
nnoremap <F3> :call CompileGcc()<CR>
func! CompileGcc()
    exec "w"
    if &filetype=='c'
        if !isdirectory('cbuild')
            execute "! mkdir cbuild"
        endif
        exec "! gcc % -o cbuild/%<"
        " exec "term time ./cbuild/%<"
    elseif &filetype=='cpp'
        if !isdirectory('c++build')
            execute "! mkdir c++build"
        endif
        exec "! g++ % -o c++build/%<"
        " exec "term time ./build/%<"
    elseif &filetype=='java'
        if !isdirectory('javabuild')
            execute "! mkdir javabuild"
        endif
        exec "! javac -d ./javabuild/ %"
        " exec "term time java -cp ./javabuild/ %<"
    elseif &filetype=='sh'
        " :term time bash %
    elseif &filetype=='python'
        " exec "term time python3 %"
    elseif &filetype=='lua'
        " exec "term time lua %"
    elseif &filetype=='go'
        exec "! go build %<"
        " exec "term time go run %"
    endif
endfunc

nnoremap <silent><leader>s :call CheckChineseMark()<CR>:w<CR>
vnoremap <silent><leader>s :call CheckChineseMark()<CR>:w<CR>
function! CheckChineseMark()
    "依次检查
    if search('。')
        let s:line=search('。')
        execute s:line . "s/。/\./g"
    endif

    if search('，')
        let s:line=search('，')
        execute s:line . "s/，/,/g"
    endif

    if search('；')
        let s:line=search('；')
        execute s:line . "s/；/,/g"

    endif

    if  search('？')
        let s:line=search('？')
        execute s:line . "s/？/?/g"
    endif

    if search('：')
        let s:line=search('：')
        execute s:line . "s/：/\:/g"
    endif

    if search('‘')
        let s:line=search('‘')
        execute s:line . "s/‘/\'/g"
    endif

    if search('’')
        let s:line=search('’')
        execute s:line . "s/’/\'/g"
    endif

    if search('”')
        let s:line=search('”')
        execute s:line . "s/”/\"/g"
    endif

    if search('“')
        let s:line=search('“')
        execute s:line . "s/“/\"/g"
    endif

    if search('《')
        let s:line=search('《')
        execute s:line . "s/《/\</g"
    endif

    if search('》')
        let s:linie=search('》')
        execute s:line . "s/》/\>/g"
    endif

    if search('——')
        let s:line=search('——')
        execute s:line . "s/——/-/g"
    endif

    if search('）')
        let s:line=search('）')
        execute s:line . "s/）/\)/g"
    endif

    if search('（')
        let s:line=search('（')
        execute s:line . "s/（/\(/g"
    endif

    if search('……')
        let s:line=search('……')
        execute s:line . "s/……/^/g"
    endif

    if search('￥')
        let s:line=search('￥')
        execute s:line . "s/￥/$/g"
    endif

    if search('！')
        let s:line=search('！')
        execute s:line . "s/！/!/g"
    endif

    if search('·')
        let s:line=search('·')
        execute s:line . "s/·/`/g"
    endif

endfunction
