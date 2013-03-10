" .vimrc
" Kaoru Takata(@tkt_94)

syntax on
set hlsearch
set autoindent
set tabstop=4
set expandtab
set ruler
set number
set fileencodings=utf-8,cp932,latin1
set nocompatible
set backspace=indent,eol,start
set history=100
set noincsearch
set title
set smartcase
set laststatus=2
set softtabstop=0
set noexpandtab
set cindent
set shiftwidth=4
set nocompatible
set showcmd
set paste
set helplang=ja
set hidden
set autoread
set wildmode=list,longest,full
filetype off

" Vundleの設定
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

" vim-scripts上のプラグイン
Bundle "grep.vim"

" github上のプラグイン
Bundle "Shougo/neocomplcache"
Bundle "Shougo/unite.vim"
Bundle "thinca/vim-ref"
Bundle "thinca/vim-quickrun"
Bundle "mattn/zencoding-vim"
Bundle "tpope/vim-markdown"
Bundle "scrooloose/nerdtree"
Bundle "kmnk/vim-unite-giti"
Bundle "fholgado/minibufexpl.vim"
Bundle "mattn/webapi-vim"
Bundle "tyru/open-browser.vim"
Bundle "basyura/twibill.vim"
Bundle "basyura/bitly.vim"
Bundle "mattn/favstar-vim"
Bundle "basyura/TweetVim"
Bundle "h1mesuke/unite-outline"

" 関数

" 全角スペースを強調させるお（＾ω＾ ≡ ＾ω＾）お）
function! Zenkaku()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
augroup ZenkakuSpace
autocmd!
autocmd ColorScheme       * call ZenkakuSpace()
autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END
call Zenkaku()
endif

" プラグインの設定

" NERDTreeの設定
nmap <silent> <C-e>      :NERDTreeToggle<CR>
	vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	omap <silent> <C-e>      :NERDTreeToggle<CR>
	imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeMouseMode=2

" minibufexplの設定
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
