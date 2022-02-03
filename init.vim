call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'

" Conquer of Completion
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Elixir language server extension based on elixir-ls for coc.nvim.
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
" File detection
Plug 'elixir-editors/vim-elixir'
" Elixir Formatter
Plug 'mhinz/vim-mix-format'

" Git
Plug 'airblade/vim-gitgutter'

" Javascript and co. formatter
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

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

" COC
set cmdheight=2             " Give more space for displaying messages.
set updatetime=300
set shortmess+=c            " Don't pass messages to |ins-completion-menu|.
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
nnoremap <leader>d :CocDiagnostics<CR>
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" STATUS LINE
set statusline=                   " Clear status line when vimrc is reloaded.
set statusline+=\ %F\ %M\ %Y\ %R  " Status line left side.
set statusline+=%=                " Use a divider to separate the left side from the right side.
" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2  " Show the status on the second to last line.



" MAPPINGS --------------------------------------------------------------- {{{

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" use leader w for saving:
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Switch between next and previous buffers
"nnoremap <leader><leader> <c-^>
nnoremap bn :bn<CR>
nnoremap bv :bp<CR>

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$


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

" Buffers
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
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

" NERDTree
" Toggle open and close
nnoremap <silent><leader>a :NERDTreeToggle<CR>
" Open current buffer in NERDTree
map <leader>r :NERDTreeFind<CR>
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

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

" CoC

" vim-mix-format
let g:mix_format_on_save = 1

" Prettier
" Run prettier for JS files and co. on save:
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue, PrettierAsync

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :Ag<CR>
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" GITGUTTER
" Jump between hunks
nmap ] <Plug>(GitGutterNextHunk)  " git next
nmap [ <Plug>(GitGutterPrevHunk)  " git previous
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)  " git undo (chunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

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

" }}}


