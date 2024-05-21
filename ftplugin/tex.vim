setlocal textwidth=120
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" Each new item starts with two asterics followed by the file, potentially
" a line number and sometimes even the message itself is on the same line.
" Please note that the trailing whitspaces in the error formats are
" intentional as pplatex produces these.

" Start of new items with file and line number, message on next line(s).
setlocal errorformat=%E**\ Error\ \ \ in\ %f\\,\ Line\ %l:%m
setlocal errorformat+=%W**\ Warning\ in\ %f\\,\ Line\ %l:%m
setlocal errorformat+=%I**\ BadBox\ \ in\ %f\\,\ Line\ %l:%m

" Start of new items only line number, message on next line(s).
setlocal errorformat+=%E**\ Error\ \ \\,\ Line\ %l:%m
setlocal errorformat+=%W**\ Warning\\,\ Line\ %l:%m
setlocal errorformat+=%I**\ BadBox\ \\,\ Line\ %l:%m

" Start of items with with file, line and message on the same line. There are
" no BadBoxes reported this way.
setlocal errorformat+=%E**\ Error\ \ \ in\ %f\\,\ Line\ %l:%m
setlocal errorformat+=%W**\ Warning\ in\ %f\\,\ Line\ %l:%m

" Start of new items with only a file.
setlocal errorformat+=%E**\ Error\ \ \ in\ %f:%m
setlocal errorformat+=%W**\ Warning\ in\ %f:%m
setlocal errorformat+=%I**\ BadBox\ \ in\ %f:%m

" Start of items with with file and message on the same line. There are
" no BadBoxes reported this way.
setlocal errorformat+=%E**\ Error\ in\ %f:%m
setlocal errorformat+=%W**\ Warning\ in\ %f:%m

" Undefined reference warnings
setlocal errorformat+=%W**\ Warning:\ %m\ on\ input\ line\ %#%l.
setlocal errorformat+=%W**\ Warning:\ \ %m
setlocal errorformat+=%W**\ Warning:\ %m
setlocal errorformat+=%W**\ Warning:\ 

" Some errors are difficult even for pplatex
setlocal errorformat+=%E**\ Error\ \ :%m

" Anything that starts with three spaces is part of the message from a
" previously started multiline error item.
setlocal errorformat+=%C\ %#%m\ on\ input\ line\ %#%l.
setlocal errorformat+=%C\ %#%m

" Items are terminated with two newlines.
setlocal errorformat+=%-Z

" Skip statistical results at the bottom of the output.
setlocal errorformat+=%-GResult%.%#
setlocal errorformat+=%-G%.%#

setlocal formatoptions+=wat
setlocal formatoptions-=l
setlocal foldmethod=marker
setlocal foldmarker=\\begin,\\end

let b:copilot_enabled = 0
hi Folded guibg=#131c2b guifg=#A0A0A0

MUcompleteAutoOff
IndentLinesDisable
