" lua<<EOF
" print("init.lua loaded")
" vim.defer_fn(function()
" vim.fn.system("sleep 1s")
" end,5000)
" EOF

" 基础配置
source $HOME/.config/nvim/viml/init.vim

" 加载插件
lua require("init")

" 安装依赖
nnoremap <F2> :PackerSync<CR>
