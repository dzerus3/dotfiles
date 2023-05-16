"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XDG Compliance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')

set backupdir=$XDG_STATE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_STATE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_STATE_HOME/vim/undo     | call mkdir(&undodir,   'p')
set viewdir=$XDG_STATE_HOME/vim/view     | call mkdir(&viewdir,   'p')

if !has('nvim') | set viminfofile=$XDG_STATE_HOME/vim/viminfo | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enables dynamic cursor
set guicursor=n-v-c:blinkon0-block-Cursor/lCursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Disables showing current mode
"set noshowmode

" Enable syntax highlighting
syntax on

" Enables 24-bit colors
set termguicolors

" Sets encoding to UTF-8
set encoding=UTF-8

" Folding
set foldmethod=indent

" Disables folding by default
set nofoldenable

" Enables persistent undo
set undofile

" Disables swapfiles
set noswapfile

" Number of lines that remain visible cursor when scrolling
set scrolloff=7
set sidescrolloff=7

" Disables wrapping
set nowrap

" Visible whitespace
" See :help lua line 1139
set list

set listchars=trail:-,tab:▸\ ,extends:❱,precedes:❰,multispace:·,lead:\ 

" Don't insert completion option until it is selected
set completeopt=noinsert,menuone,noselect

" Height of the command bar
set cmdheight=1

" Case sensitive search only when at least one capital is
" present
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Start searching before pressing enter
set incsearch

" Make it so vim handles numbers with leading zeroes correctly
set nrformats-=octal

" Enables relative numbers
set relativenumber

" Tweaks for working with manpages, help, and plaintext
augroup plaintext
    autocmd!

    " Applies to markdown, plaintext, and LATEX
    autocmd FileType markdown,text,plaintex
    \ setlocal norelativenumber  " Disables relative numbers
    autocmd FileType markdown,text,plaintex
    \ setlocal wrap              " Enables line wrapping
    autocmd FileType markdown,text,plaintex
    \ setlocal linebreak         " Makes lines break at spaces
    autocmd FileType markdown,text,plaintex
    \ setlocal display+=lastline " TODO: What does this do?

    " Applies to man and help pages
    autocmd FileType man,help
    \ setlocal scrolloff=99999    " Always centers screen
    autocmd FileType man,help
    \ nnoremap <buffer> q :q!<CR> " Rebinds q to quit
augroup end

" Remember position after exiting file
augroup fileposition
    autocmd!
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft =~ 'gitcommit'
    \ | exe "normal! g'\"" | endif
augroup end

" Auto yank to clipboard
set clipboard=unnamedplus

" Sets the number of lines of history that will be stored
set history=50

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Allows backspace to delete everything
set backspace=eol,start,indent

" Don't redraw while executing macros; improves performance
set lazyredraw

" Ignore useless files with :e
" Version control
set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" Compiled files
set wildignore+=*.o,*.elf,*.pyc,*.bin,*.exe,*.msi
" Images
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.webp,*.ico
" Binary documents
set wildignore+=*.pdf,*.doc*,*.xls*,*.ppt*,*.odt,*.djvu,*.fb2
" Archives
set wildignore+=*.zip,*.tar,*.rar,*.7z,*.gz,*.bz2
" Audio
set wildignore+=*.mp3,*.opus,*.wav,*.flac,*.m4a,*.m4b
" Video
set wildignore+=*.mp4,*.mkv,*.webm,*.avi
" Miscellaneous
set wildignore+=*.dat,*.db,*.iso,*.img,*.torrent

" Set tab size to 4 spaces
set tabstop=4
set shiftwidth=0

" Auto convert tabs to spaces
set expandtab

" Disables netrw (file manager; runs when you open a directory)
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colemak remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Movement keys rebound to neio
noremap n h
noremap e j
noremap i k
noremap o l
noremap ge gj
noremap gi gk

" Insert mode now bound to l
noremap l i
noremap L I
noremap gl gi

" Search result navigation with h
noremap h n
noremap H N
" Search forward/backward and select
noremap gh gn
noremap gH gN
noremap gn <nop>
noremap gN <nop>
noremap go <nop>
noremap gO <nop>

" Insert mode with newline is now on k
noremap k o
noremap K O

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ze and zi move cursor to top/bottom of visible screen
noremap ze L
noremap zi H

" W and B move to beginning/end of word inclusive
noremap W e
noremap B gE

" E and I function like PageUp/Down
noremap E <C-f>
noremap I <C-b>

" Lower case j joins lines
noremap j J

" Leader-action to delete without copying
noremap <leader>x \"_x
noremap <leader>X \"_X
vnoremap <leader>x \"_x

noremap <leader>s \"_s
noremap <leader>S \"_S
vnoremap <leader>s \"_s

noremap <leader>c \"_c
noremap <leader>C \"_C
vnoremap <leader>c \"_c

noremap <leader>d \"_d
noremap <leader>D \"_D
vnoremap <leader>d \"_d

" Hack to work around conflict with `d`elete `i`n
nnoremap di dk
nnoremap dd dd

" Enter clears toggles highlighting
noremap <CR> :set hlsearch!<CR>

" Easy window switching
noremap <leader>n :wincmd h<CR>
noremap <leader>e :wincmd j<CR>
noremap <leader>i :wincmd k<CR>
noremap <leader>o :wincmd l<CR>

" Creating newline without insert mode
noremap <C-k> o<Esc>o
noremap <C-S-K> O<Esc>O

" Movement between previous motions
noremap <C-H> <C-O>
noremap <C-S-H> <C-I>

" <leader>l toggles line numbers
nnoremap <leader>l :set number!<CR>
" <leader>r toggles relative line numbers
nnoremap <leader>r :set relativenumber!<CR>
" <leader>r toggles both types of line numbers
nnoremap <leader>a :set relativenumber!<CR>:set number!<CR>

" Leader + h allows highlighting `l`ine or `c`olumn
nnoremap <leader>hl :set cursorline!<CR>
nnoremap <leader>hc :set cursorcolumn!<CR>

" Disables the arrow keys
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Up> <nop>
noremap <Right> <nop>

inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Right> <nop>

" Disables Ctrl + w in insert mode
inoremap <C-w> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
" Inspired by elements of:
" https://stackoverflow.com/a/5380230
" https://stackoverflow.com/a/10416234
" https://github.com/amix/vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2
set termguicolors

" Colors for status line
highlight User1 guifg=#CE933B guibg=#333333
highlight User2 guifg=#76CE3B guibg=#333333
highlight User3 guifg=#933BCE guibg=#333333
highlight User4 guifg=#EA5031 guibg=#333333
highlight User5 guifg=#F2E863 guibg=#333333
highlight User6 guifg=#CCCCCC guibg=#333333
highlight User7 guifg=#FFFFFF guibg=#333333

set statusline=
" Buffer number
set statusline +=%1*\ %02n\ %*
" File name (up to 40 characters)
set statusline +=%2*%<%.40t%*
" File type
set statusline +=%3*\ %Y\ %*
" Flags (modified, readonly, help, etc.)
set statusline +=%4*%m%r%w%h%*
" Separator
set statusline +=%1*%=
" Column number
set statusline +=%5*%c%6*:
" Row number/Number of rows
set statusline +=%5*%l%6*/%1*%L
" Percentage of location
set statusline +=%7*%6p%%\ \ 
