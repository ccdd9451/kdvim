" Smart way to move between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Easier Window Moving
map <C-W><C-J> <C-W>J
map <C-W><C-K> <C-W>K
map <C-W><C-H> <C-W>H
map <C-W><C-L> <C-W>L

" Go to home and end using capitalized directions
nnoremap H ^
nnoremap L $
nnoremap Y y$

" Highlights toggle
nnoremap <silent><leader>/ :nohls \| redraw! <CR>

" Quicker quit
nnoremap q <Esc>
nnoremap qq :q!<CR>
nnoremap Q q

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" buffer switching
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>


" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Use sane regexes
nnoremap / /\v

"Treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Delete / Replace without changing registers
nnoremap <leader>d "_d
nnoremap <leader>p "_Vp

" Split into two columns when working in a long file
nnoremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" easier last cmd hit
nnoremap @; @:
