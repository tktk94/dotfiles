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
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

" plugin on vim-scripts
Bundle "grep.vim"

" plugin on github
Bundle "Shougo/neocomplcache"
Bundle "Shougo/unite.vim"
Bundle "thinca/vim-ref"
Bundle "thinca/vim-quickrun"
Bundle "mattn/zencoding-vim"
