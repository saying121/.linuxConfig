" 基本设置
source ~/.config/nvim/viml/base.vim

source ~/.config/nvim/viml/keymaps.vim

source ~/.config/nvim/viml/functions.vim

source ~/.config/nvim/viml/statusline-config.vim

source ~/.config/nvim/viml/autocmds.vim

" ----------------------
if !has('nvim')

call plug#begin()

Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'tribela/vim-transparent'
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme nightfox

endif
