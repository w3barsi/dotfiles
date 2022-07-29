"VIM SETTINGS
"nnoremap n nzzzv
"nnoremap N Nzzzv
"nnoremap <leader>h :wincmd h<CR>
"nnoremap <leader>j :wincmd j<CR>
"nnoremap <leader>k :wincmd k<CR>
"nnoremap <leader>l :wincmd l<CR>
"nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <Leader>- :vertical resize -5<CR>
"nnoremap <Leader>= :vertical resize +5<CR>
"nnoremap <leader><Tab> :tabn<CR>

"Yank to end of line
nnoremap Y y$ 
" Undo to certain breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
" MOVING TEXT
"vnoremap <silent> K :m '<-2<CR>gv=gv
"vnoremap <silent> J :m '>+1<CR>gv=gv
"nnoremap <leader>j :m .+1<CR>==
"nnoremap <leader>k :m .-2<CR>==

inoremap <silent> <C-j> <esc>:m .+1<CR>==
inoremap <silent> <C-k> <esc>:m .-2<CR>==
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . "k"
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . "j"
"fd=format document
nnoremap <leader>fd gg=G<C-o>
" Ctrl-BS to delete previows word in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>


" File Navigation
nnoremap <silent> <leader>pp :NvimTreeToggle<CR>

nnoremap <silent> <C-p> :lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <silent> <leader>pg :lua require('telescope.builtin').live_grep({hidden=true})<cr>
nnoremap <silent> <leader>pb :lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> <leader>ph :lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> <leader>pc :lua require('telescope.builtin').commands()<cr>
nnoremap <silent> <Leader>css :lua require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown({}))<cr>
let g:pear_tree_ft_disabled = ['TelescopePrompt']

nnoremap <silent> <leader>gg :LazyGit<CR>

nmap <C-_> <plug>NERDCommenterToggle<cr>


nnoremap <Leader>e :Emmet<SPACE>

" source init.vim
nnoremap <silent> <Leader>sv :source % <CR>
nnoremap <silent> <Leader>pi :source % <CR> :PlugInstall<CR>



nnoremap <silent>co :copen<CR>
nnoremap <silent>cj :cnext<CR>
nnoremap <silent>ck :cprev<CR>

let g:UltiSnipsJumpForwardTrigger="<C-j>"

nnoremap <leader>n :RunFile toggleterm<CR>
