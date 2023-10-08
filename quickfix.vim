const s:EFM_TYPE = #{E: 'error', W: 'warning', I: 'info', N: 'note'}
fu QuickFixTextFunc(info) abort
    if a:info.quickfix
        let qfl = getqflist(#{id: a:info.id, items: 0}).items
    else
        let qfl = getloclist(a:info.winid, #{id: a:info.id, items: 0}).items
    endif
    let l = []
    let lnum_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
        \ ->map({_, v -> qfl[v].lnum})
        \ ->max()
        \ ->len()
    let col_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
        \ ->map({_, v -> qfl[v].col})
        \ ->max()
        \ ->len()
    let fname_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
        \ ->map({_, v -> qfl[v].bufnr->bufname()->fnamemodify(':t')->strchars(1)})
        \ ->max()
    let type_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
        \ ->map({_, v -> get(s:EFM_TYPE, qfl[v].type, '')->strlen()})
        \ ->max()
    let errnum_width = range(a:info.start_idx - 1, a:info.end_idx - 1)
        \ ->map({_, v -> qfl[v].nr})
        \ ->max()
        \ ->len()
    for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
        let e = qfl[idx]
        if !e.valid
            let fname = printf('%-*S', fname_width, "-")
            let lnum = printf('%*d', lnum_width, 0)
            let col = printf('%*d', col_width, 0)
            let type = printf('%-*S', type_width, '')
            let errnum = printf('%*S', errnum_width + 1, '')
            let content = trim(e.text)
            call add(l, printf('%s | %s col %s %s%s | %s', fname, lnum, col, type, errnum, content))
        else
            let fname = printf('%-*S', fname_width, bufname(e.bufnr)->fnamemodify(':t'))
            let lnum = printf('%*d', lnum_width, e.lnum)
            let col = printf('%*d', col_width, e.col)
            let type = printf('%-*S', type_width, get(s:EFM_TYPE, e.type, e.type))
            let errnum = ''
            if e.nr
                let errnum = printf('%*d', errnum_width + 1, e.nr)
            endif
            let content = trim(e.text)
            call add(l, printf('%s | %s col %s %s%s | %s', fname, lnum, col, type, errnum, content))
        endif
    endfor
    return l
endfu
set qftf=QuickFixTextFunc nowrap | syn on
