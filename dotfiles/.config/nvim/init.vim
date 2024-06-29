call plug#begin('/home/eddieberman/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'prichrd/netrw.nvim'
Plug 'mxw/vim-jsx'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'lervag/vimtex'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/goyo.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'mhinz/vim-startify'
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/vim-floaterm'
Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
call plug#end()

" Colorscheme stuff
colorscheme jellybeans
"colorscheme gruvbox-material
syntax on
set background=dark
set guifont=Monaco:h10 

if (has("termguicolors"))
  set termguicolors
endif

let g:floaterm_wintype = 'vsplit'
function! FloatTermIgnoreKeys()
  " Remap <C-w> combinations in terminal mode to pass to Neovim
  tnoremap <buffer> <C-w>h <C-\><C-n><C-w>h
  tnoremap <buffer> <C-w>j <C-\><C-n><C-w>j
  tnoremap <buffer> <C-w>k <C-\><C-n><C-w>k
  tnoremap <buffer> <C-w>l <C-\><C-n><C-w>l
  tnoremap <buffer> <C-w>v <C-\><C-n><C-w>v
endfunction
autocmd! TermOpen term://*floatterm#* call FloatTermIgnoreKeys()
function! ToggleFloaterm()
    if exists('*floaterm#is_opened') && floaterm#is_opened()
        " If a floaterm is open, toggle its visibility
        FloatermHide
    else
        " Otherwise, open a new floaterm
        FloatermNew
    endif
endfunction


" Map the toggle function to a key, such as <F12>
nnoremap <F12> :call ToggleFloaterm()<CR>

"cnoremap wq wq!

let g:toggleterm_size = 50
let g:toggleterm_direction = 'float'
let g:toggleterm_float = 1

nnoremap <Leader>tt :ToggleTerm<CR>

nnoremap <Leader>ff :Telescope find_files<CR>
nnoremap <Leader>fg :Telescope live_grep<CR>
nnoremap <Leader>fb :Telescope buffers<CR>
nnoremap <Leader>fh :Telescope help_tags<CR>

" Map <Leader>tn and <Leader>tp to navigate between terminals
nnoremap <Leader>tn :ToggleTermNext<CR>
nnoremap <Leader>tp :ToggleTermPrev<CR>

" Map <Leader>tc to close the current terminal split
nnoremap <Leader>tc :ToggleTermClose<CR>

" Customize terminal size and position (optional)
let g:toggleterm_size = 50
let g:toggleterm_direction = 'float'
let g:toggleterm_float = 1

call wilder#setup({'modes': [':', '/', '?']})

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = -28
let g:netrw_browsex_viewer = "firefox"


" Optional: Customize Gruvbox settings
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'

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

set splitright

function! OpenFileRight()
  " Save the current file path
  let l:file = expand("<cfile>")
  " Open a new vertical split and move to the rightmost window
  rightbelow vnew
  wincmd L
  " Open the saved file path in the new window
  execute 'edit ' . l:file
endfunction

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
function! DisplayStartMessage()
  let l:lines = readfile('/home/eddieberman/art.txt')
  for l:line in l:lines
    echo l:line
  endfor
endfunction

if argc() == 0 && !exists("s:std_in")
  call DisplayStartMessage()
endif
