" 設置leader鍵
let mapleader = " "
" 如果沒有vim-plug會先安裝
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" 第三方套件
call plug#begin()
  " 左側顯示檔案tree
  Plug 'preservim/nerdtree'
call plug#end()

" tab改為空4格(預設8格)
set clipboard=unnamed
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" 顯示行號
set number
" nerdtree 快捷鍵映射
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
