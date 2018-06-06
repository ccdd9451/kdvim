" Vim Scripts
let mapleader = ';'
let g:mapleader = ';'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/.bundle')
ruby <<EOF
Dir.glob(ENV["HOME"]+"/.vim/bundle.rc/*.vimrc").each do |x|
  Vim.command "source #{x}"
end
EOF
call plug#end()

ruby <<EOF
Dir.glob(ENV["HOME"]+"/.vim/vim.rc/*.vimrc").each do |x|
  Vim.command "source #{x}"
end
EOF

