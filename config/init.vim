set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '/usr/bin/python3'
let g:airline_theme='dracula'

au VimEnter *  NERDTree

call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim'
Plug 'valloric/youcompleteme'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/bash-support.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'raimondi/delimitmate'
call plug#end()
