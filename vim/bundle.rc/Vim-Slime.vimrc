Plug 'jpalardy/vim-slime'

let g:slime_python_ipython = 1

let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend
nmap <CR><CR> <Plug>SlimeParagraphSend



