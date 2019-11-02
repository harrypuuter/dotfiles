if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set clipboard=unnamedplus

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme dracula

" set airline theme
let g:airline_theme = 'tender'
" Put your non-Plugin stuff after this line
set number
set paste
