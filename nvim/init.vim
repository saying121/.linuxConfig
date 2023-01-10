scriptencoding utf-8

" 基础配置
source $HOME/.config/nvim/viml/init.vim

" 加载插件
lua require("init")

" 安装依赖
nnoremap <F2> :Lazy sync<CR>
