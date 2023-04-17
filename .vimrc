" =====================Vim基本設定====================
" 設置leader鍵
let mapleader = " "
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
" 啟用光標行突出, 設置nord主題下可達到類似IDE選擇行的效果
set cursorline
" 在版本IMproved 8.1中替換默認光標形狀 https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"
" 開啟真色彩, 如果有啟用nord-vim plugin, 此設置才會正常顯示
if has("termguicolors")
    set termguicolors
endif

" =====================Vim Plugin安裝,使用plug套件管理工具====================
" 如果沒有vim-plug會先安裝
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" 第三方套件, 加入新套件執行"PlugInstall"安裝
call plug#begin()
  Plug 'preservim/nerdtree' " 左側顯示檔案tree
  Plug 'davidhalter/jedi-vim' " for python3
  Plug 'mtdl9/vim-log-highlighting' " .log file語法高亮
  Plug 'lazywei/vim-doc-tw' " 中文說明文件
  Plug 'arcticicestudio/nord-vim' " 更改vim外觀
  Plug 'vim-airline/vim-airline' " 下方資訊欄
  Plug 'vim-airline/vim-airline-themes' " 下方資訊欄
call plug#end()

" =====================Vim Plugin相關設定====================
" nerdtree
" 快捷鍵映射
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" 顯示隱藏檔案
let NERDTreeShowHidden=1

" python plugin要設置使用的python路徑
let g:jedi#environment_path = "/usr/bin/python3.8"

" airline
let g:airline_theme='nord' " 設置nord主題
let g:airline_powerline_fonts=1 " **字體必須設**,否則亂碼,設置前要先安裝powerline字型
let g:airline#extensions#tabline#enabled=1 " 頂部行顯示文件資訊

" nord-vim 設定主題
colorscheme nord
