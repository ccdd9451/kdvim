setlocal makeprg=ruby\ -w\ %
setlocal path+=lib

function! s:GetRequiredFilePath()
    let l:cword = expand('<cWORD>')
    let l:cword_strip = substitute(l:cword, '[\"'']', '', 'g')
    let l:gemfile = system('gem which ' . l:cword)
    let l:globfile = globpath('%:h', l:cword_strip . '*')
    echo l:globfile

    if v:shell_error == 0
        return 'e ' . l:gemfile
    elseif filereadable(l:globfile)
        return 'e ' . l:globfile
    else
        return 'find ' . l:cword_strip
    endif
endfunction

nnoremap <buffer> gf :exec <SID>GetRequiredFilePath()<cr>

function! RunRake(...)
  " Save the current makeprg setting
  let l:original_makeprg = &makeprg
  " Set makeprg to rake with any additional arguments
  let &makeprg = 'rake ' . join(a:000, ' ')
  " Run the make command
  execute ':make'
  " Restore the original makeprg setting
  let &makeprg = l:original_makeprg
endfunction

command! -nargs=* Rake call RunRake(<f-args>)
cnoreabbrev rake Rake
