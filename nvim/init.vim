" 基础配置
source $HOME/.config/nvim/viml/init.vim
" 加载插件
source ~/.config/nvim/plugin/init.vim

" 加载插件
lua require("init")

" 安装依赖
nnoremap <F2> :PackerSync<CR>
