Plug 'preservim/nerdtree'

" Toggle open and close
nnoremap <silent><leader>a :NERDTreeToggle<CR>

" Open current buffer in NERDTree
map <leader>r :NERDTreeFind<CR>

" Show hidden files
let NERDTreeShowHidden=1

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
