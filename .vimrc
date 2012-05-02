" To install vim with Ruby support:
" http://blog.jerodsanto.net/2011/08/brew-install-vim/

" List of plugins (for self reference):
" command-t
" tComment
" vim-fugitive
" vim-markdown
" vim-ruby
" supertab
" vim-coffee-script
" vim-less
" vim-rails


" Don't care about vi compatibility
set nocompatible

" Enable pathogen
call pathogen#infect()

syntax on
set number
set ruler

set encoding=utf-8

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·" shows dot for empty spaces

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Load plugin and indentation
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

" Command-T configuration
let g:CommandTMaxHeight=20
" For some reasons the esc key is not detected in command-t
let g:CommandTCancelMap=['<ESC>','<C-c>']

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

set wrap
set wrapmargin=2
set textwidth=72

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" *mm arre Objective C files
au BufRead,BufNewFile *.mm set filetype=c

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set showcmd

" Allow backgrounding buffers without writing them, and remember marks/undo for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" For sudo
cmap w!! %!sudo tee > /dev/null %

map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

" Disable automatic comments (no! let's write documentation instead!)
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" highlight current line
set cursorline

let mapleader=","

" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>

" Switch between the last two files
noremap <leader><leader> <c-^>

" Exit insert mode
:imap jj <Esc>

" Generate tags for all gems
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>

" Use default pane with vimux
let VimuxUseNearestPane = 1
" Tell vim-vroom to use vimux
let g:vroom_use_vimux = 1
