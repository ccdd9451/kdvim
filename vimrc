" Vundle configuring {{{1

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'lifepillar/vim-mucomplete'
Plugin 'dense-analysis/ale'
Plugin 'othree/xml.vim'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'github/copilot.vim'
Plugin 'lervag/vimtex'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'airblade/vim-rooter'
Plugin 'embear/vim-localvimrc'
Plugin 'gioele/vim-autoswap'
Plugin 'maxbrunsfeld/vim-emacs-bindings'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'kshenoy/vim-signature'
Plugin 'wakatime/vim-wakatime'
Plugin 'skywind3000/asyncrun.vim'

Plugin 'luochen1990/rainbow'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required

" builtints {{{1

unlet! skip_defaults_vim
runtime! defaults.vim
autocmd! vimHints

packadd! matchit
runtime! ftplugin/man.vim

" package - completion {{{1

let g:ale_linters = {}
let g:ale_linters.vim = ['vint']
let g:ale_linters.ruby = ['rubocop']
let g:ale_linters.sh = ['shellcheck']
let g:ale_linters.javascript = ['standard']

let g:ale_fixers = {}
let g:ale_fixers.cpp = ['clang-format']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_fixers.javascript = ['standard']

let g:ale_linters_explicit = 1
let g:ale_virtualtext_cursor = 'current'

let g:mucomplete#no_mappings = 1
let g:mucomplete#always_use_completeopt = 1
let g:mucomplete#enable_auto_at_startup = 0
let g:mucomplete#completion_delay = 0

let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['omni', 'path', 'incl', 'dict', 'uspl']
let g:mucomplete#chains.cpp = ['omni', 'incl', 'tags', 'path', 'ulti']
let g:mucomplete#chains.vim = ['path', 'cmd', 'keyn']

let g:UltiSnipsEditSplit = "tabdo"
let g:UltiSnipsExpandTrigger = "<f5>" 
let g:UltiSnipsListSnippets = "<f6>" 
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsExpandTrigger="<C-x><C-o>"

" package - airline {{{1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = g:airline_left_sep
let g:airline#extensions#tabline#left_alt_sep = g:airline_left_alt_sep
let g:airline#extensions#tabline#right_sep = g:airline_right_sep
let g:airline#extensions#tabline#right_alt_sep = g:airline_right_alt_sep

" package - others {{{1

let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['cpp', 'tex']
let g:rainbow_active = 1
let g:airline_theme='papercolor'

let g:localvimrc_persistent = 2
let g:localvimrc_sandbox = 0

let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 1

" appearance {{{1

set number relativenumber
set list listchars=tab:▸\ ,trail:·,nbsp:␣,extends:»,precedes:«
set showcmd visualbell shortmess+=c belloff+=ctrlg
set splitright

set termguicolors background=dark
colorscheme PaperColor

" leaders {{{1

let mapleader = '\'
nnoremap M :make!<space>
nnoremap <leader>m :make!<space>
nnoremap <leader>am :AsyncRun make<space>
nnoremap <leader>v :vertical<space>
nnoremap <leader>Q Q
nnoremap <leader>f :Files<CR>
"nnoremap <nowait>qq :quit
"nnoremap <C-q> q
"nnoremap q <nop>

" completion {{{1

set noinfercase ignorecase smartcase
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert,longest
set omnifunc=ale#completion#OmniFunc
set dictionary=/usr/share/dict/american-english
set formatoptions=cjoql

inoremap <C-n> <C-x><C-o>
nnoremap <silent><nowait> <A-CR><A-CR> :ALEFix<CR> 

" others {{{1
source $HOME/.vim/quickfix.vim

set exrc secure
set autowriteall
set mouse=a ttymouse=sgr balloonevalterm
set grepprg=ag\ --vimgrep\ $* 
set grepformat=%f:%l:%c:%m

set printoptions=paper:letter
let g:tex_flavor='latex'

let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize='-50'

augroup formatset
  autocmd!
  autocmd ModeChanged [vV\x16]*:i setlocal fo-=a
  autocmd ModeChanged n:i setlocal fo-=j
  autocmd ModeChanged *:n setlocal fo+=j
augroup END

augroup termset
  autocmd!
  autocmd TerminalOpen * setlocal nonumber norelativenumber
augroup END

command Bd :up | %bd | e#
" }}}1 vim: set ts=2 sw=2 sts=2 et fdm=marker fdl=99 :
