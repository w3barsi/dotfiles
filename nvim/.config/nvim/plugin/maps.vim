"VIM SETTINGS

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>p :NERDTreeFind<CR> 
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>= :vertical resize +5<CR>

"Yank to end of line
nnoremap Y y$ 
" Undo to certain breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
" MOVING TEXT
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
inoremap <silent> <C-j> <esc>:m .+1<CR>==
inoremap <silent> <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . "k"
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . "j"
"fd=format document
nnoremap <leader>fd gg=G<C-o>

" File Navigation
nnoremap <C-p> :lua require('telescope.builtin').find_files()<cr>
let g:pear_tree_ft_disabled = ['TelescopePrompt']

nmap <C-_> <plug>NERDCommenterToggle<cr>

" REPLACEALL & REPLACEWORD
nnoremap <Leader>ra :%s//g<Left><Left>
nnoremap <Leader>rw :%s//gc<Left><Left><Left>

" source init.vim
nnoremap <Leader>sv :source %<CR>

" COC
" nmap <Leader>gd <Plug>(coc-definition)
" nmap <Leader>gr <Plug>(coc-references)
" nmap <leader>b <Plug>(coc-diagnostic-prev)
" nmap <leader>n <Plug>(coc-diagnostic-next)
" nmap <leader>gb <Plug>(coc-diagnostic-prev-error)
" nmap <leader>gn <Plug>(coc-diagnostic-next-error)

nnoremap <Leader>e :Emmet<SPACE>
" nmap <leader>p :CocCommand prettier.formatFile<CR>
