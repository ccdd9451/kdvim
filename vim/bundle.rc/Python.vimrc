Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'Glench/Vim-Jinja2-Syntax'

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
