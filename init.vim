
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"


"=======================================================================
" PLUGINS
"=======================================================================

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/easymotion.vim
source ~/.config/nvim/plugins/test.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/comfortable-motion.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/move.vim
source ~/.config/nvim/plugins/winresizer.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/auto-pairs.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/prettier.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/bbye.vim
source ~/.config/nvim/plugins/mundo.vim

" Search within a file
source ~/.config/nvim/plugins/incsearch.vim
source ~/.config/nvim/plugins/incsearch-fuzzy.vim
source ~/.config/nvim/plugins/incsearch-easymotion.vim

" GIT
" For single source file
source ~/.config/nvim/plugins/gitgutter.vim
" For project-wide management
source ~/.config/nvim/plugins/vimagit.vim
source ~/.config/nvim/plugins/fugitive.vim

" ELIXIR
source ~/.config/nvim/plugins/coc-elixir.vim
source ~/.config/nvim/plugins/elixir.vim
source ~/.config/nvim/plugins/mix-format.vim
source ~/.config/nvim/plugins/endwise.vim

call plug#end()

syntax on                   " Turn syntax highlighting on.
filetype on                 " Enable type file detection.
syntax enable
filetype plugin on          " Enable plugins and load plugin for the detected file type.
filetype indent on          " Load an indent file for the detected file type.

" Code Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Default color scheme
"colorscheme one
colorscheme dracula

set clipboard^=unnamed,unnamedplus
set title                   " set the filename on the terminal title
set number                  " Add numbers to the file.
set whichwrap+=<,>,h,l,[,]  " causes the left and right arrow keys, as well as h and l,
                            " to wrap when used at beginning or end of lines
set cursorline              " Highlight cursor line underneath the cursor horizontally.
set numberwidth=4           " Use relative line numbering
set relativenumber          " but absolute for the current line.
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
set shiftwidth=2
set tabstop=2

" Indentation
set smartindent
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set expandtab               " Use space characters instead of tabs.
set nobackup                " Do not save backup files.
set scrolloff=10            " No scroll below or above N number of lines when scrolling.
set incsearch               " While searching though a file incrementally highlight matching characters as you type.
set ignorecase              " Ignore capital letters during search.
set smartcase               " Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters.
set showcmd                 " Show partial command you type in the last line of the screen.
set showmode                " Show the mode you are on the last line.
set showmatch               " Show matching words during a search.
set hlsearch                " Use highlighting when doing a search.
set history=1000            " Set the commands to save in history default number is 20.
set wildmenu                " Enable auto completion menu after pressing TAB.
set wildmode=list:longest   " Make wildmenu behave like similar to Bash completion.

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" STATUS LINE
set statusline=                   " Clear status line when vimrc is reloaded.
set statusline+=\ %F\ %M\ %Y\ %R  " Status line left side.
set statusline+=%=                " Use a divider to separate the left side from the right side.
" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2  " Show the status on the second to last line.

" UNDO
" save undo trees in files
" enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
" number of undo saved
set undolevels=10000

"=======================================================================
" MAPPINGS
"=======================================================================

" use leader w for saving:
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap ye y$
" Delete from cursor to the end of line.
nnoremap de d$

" noh - no highlight
map <esc> :noh <CR>

" redo
nnoremap <A-u> <C-R>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>


"=======================================================================
" NVIM

nmap <Leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <Leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <Leader>vs :source ~/.config/nvim/init.vim<cr>


"=======================================================================
" WINDOWS

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><


"=======================================================================
" BUFFERS

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
" Switch between the last two files
"nnoremap <leader><leader> <c-^>
nnoremap <Leader>ba <c-^>
" Switch between next and previous buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bf :bf<CR>
nnoremap <Leader>bl :bl<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>



"=======================================================================
" VIMSCRIPT
"=======================================================================

fun! StripTrailingWhitespace()
    %s/\s\+$//e
endfun

augroup options
    autocmd!
    " remove trailing spaces on save:
    autocmd BufWritePre * call StripTrailingWhitespace()

    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType vue setlocal shiftwidth=2 tabstop=2
augroup END

" Any help page in vertical right
autocmd FileType help wincmd L

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

