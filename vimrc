" Vundle configuring {{{1

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'lifepillar/vim-mucomplete'
Plugin 'dense-analysis/ale'
Plugin 'othree/xml.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'github/copilot.vim'
Plugin 'lervag/vimtex'

Plugin 'airblade/vim-rooter'
Plugin 'gioele/vim-autoswap'
Plugin 'kentarosasaki/vim-emacs-bindings'

Plugin 'luochen1990/rainbow'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required

" builtints {{{1

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
packadd! matchit
runtime! ftplugin/man.vim

" package - completion {{{1

let g:ale_linters = {}
let g:ale_linters.vim = ['vint']
let g:ale_linters.ruby = ['standardrb']
let g:ale_linters.sh = ['shellcheck']

let g:ale_fixers = {}
let g:ale_fixers.ruby = ['standardrb']

let g:ale_linters_explicit = 1
let g:ale_virtualtext_cursor = 'current'
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 0

let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['omni', 'ulti', 'path', 'incl', 'dict', 'uspl']
let g:mucomplete#chains.vim = ['path', 'cmd', 'keyn', 'ulti']


let g:UltiSnipsEditSplit = "tabdo"
let g:UltiSnipsExpandTrigger = "<f5>" 
let g:UltiSnipsListSnippets = "<f6>" 
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

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
"
let g:rainbow_active = 1
let g:airline_theme='papercolor'

" appearance {{{1

set number relativenumber
set list listchars=tab:▸\ ,trail:·,nbsp:␣,extends:»,precedes:«
set showcmd visualbell shortmess+=c belloff+=ctrlg
set splitright

set termguicolors background=dark
colorscheme PaperColor

" leaders {{{1

let g:mapleader = ';'
nnoremap M :make!<space>
nnoremap qq :quit
nnoremap <leader>m :make!<space>
nnoremap <leader>v :vertical<space>

" completion {{{1

set noinfercase ignorecase smartcase
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert,longest
set omnifunc=ale#completion#OmniFunc
set formatoptions=cajoql

" others {{{1

set autowriteall
set mouse=a ttymouse=sgr balloonevalterm
set grepprg=ag\ --vimgrep\ $* 
set grepformat=%f:%l:%c:%m

set printoptions=paper:letter
let g:tex_flavor='latex'
let g:netrw_winsize='-50'

source $HOME/.vim/quickfix.vim
" }}}1 vim: set ts=2 sw=2 sts=2 et fdm=marker fdl=99 :
