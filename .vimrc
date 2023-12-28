" 設置leader鍵
let mapleader = " "

" =====================Vim基本設定====================
" 自動按檔案類型縮進
filetype plugin indent on
" 複製內容會複製到剪貼簿
set clipboard=unnamedplus
" tab改為空4格(預設8格)
set tabstop=4
set shiftwidth=4
set expandtab
" 顯示行號
set number
" 設置滑鼠滾動
set mouse=a
" 啟用光標行突出, 設置nord主題下可達到類似IDE選擇行的效果
set cursorline
" 移動到距離上下n行時scrollbar就會跟著移動
set scrolloff=7
" 在版本IMproved 8.1中替換默認光標形狀 https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"
" 開啟真色彩, 如果有啟用nord-vim plugin, 此設置才會正常顯示
if has("termguicolors")
    set termguicolors
endif
" 啟用XML,HTML tag %跳轉
packadd! matchit
" 全小寫時搜尋不區分大小寫, 有包含大寫時區分
set ignorecase smartcase
" 快啟.vimrc
nnoremap <leader>ov :vsplit $MYVIMRC<cr>
" 快速重load .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" 複製函數整體(含函數名)
nnoremap <silent> yaf [m{jV]m%y
" 刪除時不存入寄存器
nnoremap <leader>d "_dd
" 插入模式下快速貼上剪貼簿內容
inoremap <C-v> <C-r>*
" v mode下貼上而不更新其他寄存器
vnoremap p "_dP
" 增加空白行不進入i mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
" 跳轉到開頭/結尾 映射成比較好按按鍵
nnoremap H ^
nnoremap L $
" 整行上移一行
nnoremap <S-C-k> :m-2<CR>==
inoremap <S-C-k> <Esc>:m-2<CR>==gi
vnoremap <S-C-k> :m-2<CR>==gv
" 整行下移一行
nnoremap <S-C-j> :m+<CR>==
inoremap <S-C-j> <Esc>:m+<CR>==gi
vnoremap <S-C-j> :m+<CR>==gv

" =====================Vim Plugin安裝,使用plug套件管理工具====================
" 如果沒有vim-plug會先安裝
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" 第三方套件, 加入新套件執行"PlugInstall"安裝
call plug#begin()
  " file tree 相關
  Plug 'preservim/nerdtree' " 左側顯示檔案tree
  Plug 'ryanoasis/vim-devicons' "tree 加上icon
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " tree icon 加入顏色

  " 外觀配置
  Plug 'arcticicestudio/nord-vim' " 好看的nord color theme
  Plug 'doums/darcula' " Jetbrain官方color theme
  Plug 'vim-airline/vim-airline' " 下方資訊欄
  Plug 'vim-airline/vim-airline-themes' " 下方資訊欄主題切換

  " other
  Plug 'tpope/vim-surround' " 修改成對符號
  Plug 'davidhalter/jedi-vim' " for python3
  Plug 'mtdl9/vim-log-highlighting' " .log file語法高亮
  Plug 'lazywei/vim-doc-tw' " 中文說明文件
  " Plug 'tpope/vim-repeat'
call plug#end()

" =====================Vim Plugin相關設定====================
" nerdtree
" 快捷鍵映射
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-j> :NERDTreeFind<CR>
" 顯示隱藏檔
let NERDTreeShowHidden=1

" python plugin要設置使用的python路徑
let g:jedi#environment_path = "/usr/bin/python3.8"

" airline
let g:airline_theme='deus' " 設置nord主題, 參考https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_powerline_fonts=1 " **字體必須設**,否則亂碼,設置前要先安裝powerline字型
let g:airline#extensions#tabline#enabled=1 " 頂部行顯示文件資訊

" 設定主題, 如果要設置airline=nord, 主題也必須是nord
colorscheme darcula

