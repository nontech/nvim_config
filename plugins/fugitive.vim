Plug 'tpope/vim-fugitive'

" Show commits for every source line
nnoremap <Leader>gb :Git blame<CR>  " git blame
" Show all changed files compared to master
nnoremap <Leader>gf :G diff --name-status master<CR>  " git diff --name-status master
" Show side-by-side diff of a file
nnoremap <Leader>gd :Gvdiffsplit<CR>
" Show git status in one line
nnoremap <Leader>gl :Gclog!<CR>
