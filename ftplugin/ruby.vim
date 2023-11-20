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
