" Ensure vim-plug is installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin('~/.config/nvim/plugged')

  " Solarized theme
  Plug 'iCyMind/NeoSolarized'

  " Haskell plugins
  Plug 'neovimhaskell/haskell-vim'

  " ALE
  Plug 'w0rp/ale'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Highlight trailing whitespace
  Plug 'ntpeters/vim-better-whitespace'

  " Git integration
  Plug 'jreybert/vimagit'
  Plug 'tpope/vim-fugitive'

  " Hybrid line numbers
  Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

" Show matching brackets
set showmatch

" Enable hybrid line numbering
set number relativenumber

" Highlight current line
set cursorline

" Show at least 8 lines of context
set scrolloff=8

" Continue comment marker in new lines
set formatoptions+=o

" Hard-wrap long lines as you type them
set textwidth=0

" Insert 2 spaces when TAB is pressed
set expandtab
set tabstop=2

" Indentation amount for < and > commands
set shiftwidth=2

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" Use Esc to exit insert mode in terminal
tnoremap <Esc> <C-\><C-n>

" Use homerow movement keys to move between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open panes to right and bottom
set splitbelow
set splitright

" Enable 24-bit color
set termguicolors

" Enable Solarized color scheme
colorscheme NeoSolarized
set background=dark
let g:neosolarized_contrast = "high"

" Enable Solarized airline and don't display INSERT mode
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
set noshowmode

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable ale in airline
let g:airline#extensions#ale#enabled = 1

" Enable syntastic in airline
let g:airline#extensions#syntastic#enabled = 1

" Show tabline
let g:airline#extensions#tabline#enabled = 1

" Enable detection of whitespace errors
let g:airline#extensions#whitespace#enabled = 1

" Remove extra whitespace on write
autocmd BufEnter * EnableStripWhitespaceOnSave

" Enable vimagit in airline
let g:airline#extensions#vimagit#enabled = 1

" Show branch in airline
let g:airline#extensions#branch#enabled = 1

" Open terminals in a new pane
fun! s:openTerm(args, vertical)
  exe a:vertical ? 'vnew' : 'new'
  exe 'terminal' a:args
endf

" :Term => :new term://<args>
" :VTerm => :vnew term://<args>
command! -nargs=* Term call s:openTerm(<q-args>, 0)
command! -nargs=* VTerm call s:openTerm(<q-args>, 1)
