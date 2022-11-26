let mapleader=";"
nnoremap * *N

" 映射按键
nnoremap <leader>w :w<CR>
nnoremap j gj
nnoremap k gk
set wrap

" copy paste system clipboard
" ^= 把值加到默认值前
"*和"+有什么差别呢？
"* 是在系统剪切板中表示选择的内容
"+ 是在系统剪切板中表示选择后Ctrl+c复制的内容
set clipboard^=unnamed          " *寄存器
" set clipboard^=unnamedplus          " +寄存器
nnoremap Y  y$

" 创建tab
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

" 切换buffer
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
nnoremap ]B :blast<CR>
nnoremap [B :bfirst<CR>

" 切换窗口
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <Esc> <C-\><C-n>

" 调整窗口大小
nnoremap <M-,> <C-W><
nnoremap <M-.> <C-W>>
nnoremap <M--> <C-W>-
nnoremap <M-=> <C-W>+

" Alt+t开启关闭终端,vim和nvim不太一样
nnoremap <M-t> :terminal<CR>A
tnoremap <M-t> exit<CR>

nnoremap <silent><BackSpace> :noh<CR>
nnoremap <space>s :source $MYVIMRC<CR>
