set completeopt=menu,menuone,noselect

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gD :lua vim.lsp.buf.decleration()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
nnoremap H :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gj :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>gk :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>gf :lua vim.lsp.buf.formatting()<CR>

