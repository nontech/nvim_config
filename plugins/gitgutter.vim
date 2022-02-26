Plug 'airblade/vim-gitgutter'

" Jump between hunks
nmap ] <Plug>(GitGutterNextHunk)  " git next
nmap [ <Plug>(GitGutterPrevHunk)  " git previous
" stages hunk and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
" undo/delete changes that are not staged yet
" note: staged chunks are not unstaged
nmap <Leader>gu <Plug>(GitGutterUndoHunk)  " git undo (chunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
" When signs don't update after focusing Vim
let g:gitgutter_terminal_reports_focus=0
