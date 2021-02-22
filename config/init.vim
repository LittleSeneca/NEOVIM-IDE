" Vim Wide Settings
"
" /Vim Wide Settings
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
" Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'jeetsukumaran/vim-buffergator'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'vimlab/split-term.vim'

" NerdTree plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'

" Surrounding Deliniation
Plug 'tpope/vim-surround'

" Git Plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'

" Initialize plugin system
call plug#end()

" Post Plugin Settings
" Syntax Settings
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Start NERDTree with Vim
autocmd VimEnter * NERDTree | wincmd p

"dracula theme and transparency
syntax on
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

"tab = 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

"display line numbers:
set number
:nmap <C-N><C-N> :set invnumber<CR>
set regexpengine=1
set lazyredraw
set ttyfast


"Airline settings
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '='
let g:airline_symbols.whitespace = 'x'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#whitespace#enabled = 0

let g:airline_theme = 'dracula'

"For geant4 syntax highlighting
autocmd BufRead,BufNewFile *.hh,*.cc set filetype=cpp.geant4
"For ROOT syntax highlighting
autocmd BufRead,BufNewFile *.cpp,*.h,*.C set filetype+=.root
"2 spaces for tab in xml files
autocmd BufRead,BufNewFile *.xml,*.dtd,*.xsd setlocal tabstop=2

"Assembler sections at new
autocmd BufNewFile *.asm read ~/.vim/yasm_new.txt

"Default window split when using termdebug
:packadd termdebug
let g:termdebug_wide=1

"Change tabs from <from> number of spaces to <to> number of spaces
function ChangeTab( from, to )
    set expandtab
    retab
    let &tabstop=a:from
    set noexpandtab
    %retab!
    let &tabstop=a:to
    set expandtab
    %retab!
endfunction

" Buffer Management Keybindings
