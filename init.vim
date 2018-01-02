" Ensure vim-plug is installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin('~/.config/nvim/plugged')

  " Solarized theme
  Plug 'altercation/vim-colors-solarized'

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

" Wrap long lines as you type them
set textwidth=100

" Insert 2 spaces when TAB is pressed
set expandtab
set tabstop=2

" Real tabs for Makefiles though
autocmd FileType make set noexpandtab

" Indentation amount for < and > commands
set shiftwidth=2

" Highlight whitespace characters
set list listchars=tab:•\ ,extends:»,precedes:«,trail:·

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" Use Esc to exit insert mode in terminal
tnoremap <Esc> <C-\><C-n>

" Use a reasonable file encoding
set encoding=utf-8

" Use homerow movement keys to move between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open panes to right and bottom
set splitbelow
set splitright

" Disable guicursor
set guicursor=

" Enable mouse for gui
set mouse=a
set mousehide

" Highlight searches, search incrementally
set hlsearch
set incsearch

" Ignore case unless capital letters are used
set ignorecase
set smartcase

" Ignore files ending with these extensions
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu

if has('gui_running')
  " Remove the toolbar
  set guioptions-=T
else
  " Do this if your emulator won't set xterm-256color
  let g:solarized_termtrans=1
endif

" Enable Solarized color scheme
colorscheme solarized
set background=dark

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

" Enable/disable Syntastic
map <Leader>s :SyntasticToggleMode<CR>

" Bindings for ghc-mod

" Insert type for top-level declaration
map <silent> tw :GhcModTypeInsert<CR>

" Case split expression under cursor
map <silent> ts :GhcModSplitFunCase<CR>

" Query type of expression under cursor
map <silent> tt :GhcModType<CR>

" Erase type query
map <silent> tc :GhcModTypeClear<CR>
