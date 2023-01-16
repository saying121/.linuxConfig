scriptencoding utf-8
" 基本设置
source ~/.config/nvim/viml/base.vim

source ~/.config/nvim/viml/keymaps.vim

source ~/.config/nvim/viml/functions.vim

source ~/.config/nvim/viml/autocmds.vim

" ----------------------
if !has('nvim')

call plug#begin()

Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'tribela/vim-transparent'
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme nightfox
" nvim的要在设置透明后再source才有颜色,而且不会出现两截状态栏
source ~/.config/nvim/viml/statusline-config.vim
set laststatus=2                            "显示状态栏信息

endif
