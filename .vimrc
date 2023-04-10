" 設置leader鍵
let mapleader = " "
" 如果沒有vim-plug會先安裝
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" 第三方套件, 加入新套件執行"PlugInstall"安裝
call plug#begin()
  " 左側顯示檔案tree
  Plug 'preservim/nerdtree'
  " for python3
  Plug 'davidhalter/jedi-vim' 
  " .log file語法高亮
  Plug 'mtdl9/vim-log-highlighting'
call plug#end()

" tab改為空4格(預設8格)
set clipboard=unnamed
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" 顯示行號
set number
" 設置滑鼠滾動
set mouse=a

" nerdtree 快捷鍵映射
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" 在版本IMproved 8.1中替換默認光標形狀
" https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"

" python plugin要設置使用的python路徑
let g:jedi#environment_path = "/usr/bin/python3.8"
