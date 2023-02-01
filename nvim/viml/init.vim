scriptencoding utf-8
" 基本设置
source ~/.config/nvim/viml/base.vim

source ~/.config/nvim/viml/keymaps.vim

source ~/.config/nvim/viml/functions.vim

source ~/.config/nvim/viml/autocmds.vim

" ----------------------

if exists('g:neovide')
    source ~/.config/nvim/viml/neovide.vim
endif

" ----------------------

if !has('nvim')

    call plug#begin()

    Plug 'francoiscabrol/ranger.vim'
    Plug 'rhysd/vim-healthcheck'
    Plug 'tribela/vim-transparent'
    Plug 'tpope/vim-commentary'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    call plug#end()

    colorscheme elflord
    syntax on        " 语法高亮
    " nvim的要在设置透明后再source才有颜色,而且不会出现两截状态栏
    source ~/.config/nvim/viml/statusline-config.vim
    source ~/.config/nvim/vim-lsp/init.vim

    " source ~/.config/nvim/coc-config/init.vim

    set laststatus=2                            "显示状态栏信息
    set undodir=~/.local/share/vim/undodir     " 指定撤销文件目录

endif
