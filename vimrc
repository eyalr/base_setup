" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let &t_Co=256

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
"  autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

set autoindent

colorscheme tango

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=500     " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
"set incsearch      " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
nnoremap <silent> <leader><space> :noh<cr>
set background=dark
set shiftwidth=4
set tabstop=4
set expandtab
set list
set number
set laststatus=2
set nowrap
set history=1000
set undolevels=1000
set title
set colorcolumn=80
set textwidth=79
set nobackup
set noswapfile
set hidden
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> ,/ :nohlsearch<CR>
set formatoptions=qrn1
set showmatch
set vb t_vb=
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set scrolloff=3
set nrformats=
nnoremap <leader>v V`]
nnoremap / /\v
vnoremap / /\v
"au FileType python source ~/.vim/plugins/python.vim
filetype indent on
set modeline

" Turn autoindent/smartindent on or off for copy/paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>
" End

nnoremap <F5> :setlocal invnumber<CR>:setlocal invlist<CR>
nnoremap <F6> :vsp <CR>:ConqueTerm bash<CR>


hi WhiteSpaceEOL ctermbg=red guibg=red term=bold
match WhiteSpaceEOL /\s\+\%#\@<!$\|.\%>80v/

function! MarkWindowSwap()
    " marked window number
    let g:markedWinNum = winnr()
    let g:markedBufNum = bufnr("%")
endfunction

function! DoWindowSwap()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe g:markedWinNum . "wincmd w"

    " Load current buffer on marked window
    exe 'hide buf' curBufNum

    " Switch focus to current window
    exe curWinNum . "wincmd w"

    " Load marked buffer on current window
    exe 'hide buf' g:markedBufNum
endfunction

nnoremap <C-w><C-h> :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <C-w><C-l> :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'

filetype indent plugin on
noremap <F12> :CommandTFlush<CR>

python from powerline.vim import setup as powerline_setup; powerline_setup(); del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set wildignore=*.po,*.swp,*.bak,*.class,*.pyc,*.jpg,*.pdf,*.jar,*.db,*.gif,*.tif,*.png,*.gz,*.swf,*.ico

let g:in_git = system('git rev-parse --show-toplevel 2>/dev/null')
if g:in_git != ''
    cd `=g:in_git`
    let g:ctrlp_user_command = 'cd %s && git ls-files . -co --exclude-standard'
endif

set tags+=.git/tags

cmap w!! w !sudo tee >/dev/null %
cmap Q q
set clipboard=unnamed
