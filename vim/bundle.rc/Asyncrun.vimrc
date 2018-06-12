Plug 'skywind3000/asyncrun.vim'

" Use F8 to auto run a script
nnoremap <F8> :call <SID>compile_and_run()<CR>
augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
    exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
    exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
    exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
    exec "AsyncRun! time python %"
    elseif &filetype == 'ruby'
    exec "AsyncRun! time ruby %"
    endif
endfunction
