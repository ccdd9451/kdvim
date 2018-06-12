Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'

" map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'


" nerdtreetabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" 关闭同步
let g:NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_synchronize_view=0
let g:nerdtree_tabs_synchronize_focus=0
" 是否自动开启nerdtree
" thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
" let g:nerdtree_tabs_open_on_console_startup=0
" let g:nerdtree_tabs_open_on_gui_startup=0

Plug 'scrooloose/nerdcommenter'

let g:NERDSpaceDelims=1
let g:NERDAltDelims_python = 1
