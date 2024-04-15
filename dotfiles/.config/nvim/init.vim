call plug#begin('/home/eddieberman/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'github/copilot.vim'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'lervag/vimtex'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
call plug#end()

" Colorscheme stuff
colorscheme jellybeans
syntax on
set background=dark
set guifont=Monaco:h10 

" set leader key
:let g:latex_to_unicode_auto = 1
let mapleader=","
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr' " Recommended for Neovim users; ensures forward search works.
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'continuous' : 1,
    \ 'background' : 1,
    \ }

" shared clipboard
" set clipboard=unnamed

" line number
set nu
set relativenumber

set clipboard=unnamedplus

" tab size to 2
set smarttab
set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" keep undofile
set undofile
set undodir=~/.config/nvim/undodir

" don't go to the bottom while scrolling
set scrolloff=10

" set encoding
set encoding=utf-8
set fileencoding=utf-8

" char limit colorline for java
au FileType java set colorcolumn=100

" stop formatting comments after enter
set formatoptions-=cro

" more buffers open
set hidden

" faster update
set updatetime=300

" don't give autocomplete messages
set shortmess+=c

" disable search highlight
set nohlsearch

" auto signcolumn
set signcolumn=auto

" Clear highlighting on esc
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" easy escape from terminal
tnoremap <Esc> <C-\><C-n>
inoremap jj <Esc>

nmap ÷ <plug>NERDCommenterToggle
vmap ÷ <plug>NERDCommenterToggle<CR>gv
nnoremap <C-n> :NERDTreeFocus<CR>
inoremap <C-n> <Esc>:NERDTreeFocus<CR>

" Rename identifier
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" [BUG] shortcut for renaming an identifier
nmap <F2> <Plug>(coc-rename)

" press kk to scroll down through autocomplete
inoremap kk <C-n>

" press ii to scroll up through autocomplete
inoremap ii <C-p>

" Map Ctrl-backspace to delete previous word in insert mode
imap <C-BS> <C-W>
imap <C-H> <C-W>

command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>

source ~/.config/nvim/coc-rc.vim
source ~/.config/nvim/vimtex-rc.vim
