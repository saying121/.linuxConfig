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
    syntax on
    source ~/.config/nvim/viml/statusline-config.vim
    source ~/.config/nvim/vim-lsp/init.vim

    " source ~/.config/nvim/coc-config/init.vim

    set laststatus=2
    set undofile
    set undodir=~/.local/share/vim/undodir     " 指定撤销文件目录
    "Mode Settings

    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

    "Cursor settings:

    "  1 -> blinking block
    "  2 -> solid block
    "  3 -> blinking underscore
    "  4 -> solid underscore
    "  5 -> blinking vertical bar
    "  6 -> solid vertical bar


    "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    "let &t_EI = "\<Esc>]50;CursorShape=0\x7"

endif
