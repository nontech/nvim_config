Plug 'vim-test/vim-test'

let test#strategy='neovim'
" << START -- hypcloud project-specific settings (later separate it) >>
" look into test-transformation to make this elegant
"let test#project_root = '~/Projects/hypcloud_projects/dev_environment/core'
"let test#elixir#exunit#executable='~/Projects/hypcloud_projects/dev_environment/scripts/compose-run-core.sh mix test'
" 2nd attempt: using autocmd method
"autocmd BufRead,BufNewFile */dev_environment/** let test#project_root = '~/Projects/hypcloud_projects/dev_environment/core'
"autocmd BufRead,BufNewFile */dev_environment/** let test#elixir#exunit#executable = '~/Projects/hypcloud_projects/dev_environment/scripts/compose-run-core.sh mix test'
" 3rd attempt: using augroup (improving over 2nd attempt)
augroup hypcloud_test
    autocmd!
    autocmd BufRead,BufNewFile */dev_environment/** let test#project_root = '~/Projects/hypcloud_projects/dev_environment/core'
    autocmd BufRead,BufNewFile */dev_environment/** let test#elixir#exunit#executable = '~/Projects/hypcloud_projects/dev_environment/scripts/compose-run-core.sh mix test'
augroup END
" -- END >>
"
" Disable clearing test screen before running the test
let g:test#preserve_screen = 1
"test terminal open in normal mode, so it does not close on key press
let g:test#neovim#start_normal = 1
" test terminal window position
let test#neovim#term_position = "vert"
" make test commands execute using neovim
"let test#strategy = 'neovim'
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
