" .vimrc
" Kaoru Takata(@tkt_94)

if has('win32') || has('win64')
	let $DOTVIM = expand('~/vimfiles')
else
	let $DOTVIM = expand('~/.vim')
endif

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
set iminsert=0
set imsearch=0
set clipboard=unnamed,autoselect
filetype off


" Vundleの設定
"set rtp+=~/dotfiles/vundle/
"call vundle#rc('$DOTVIM/bundle')
"Bundle 'gmarik/vundle'

" NeoBundleの設定
if has('vim_starting')
	set runtimepath+=$DOTVIM/bundle/neobundle.vim
	call neobundle#rc(expand('$DOTVIM/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'

filetype plugin indent on
filetype indent on

" vim-scripts上のプラグイン
NeoBundle "grep.vim"
NeoBundle "lua-support"

" github上のプラグイン
NeoBundle "Shougo/neocomplete.vim"
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "Shougo/unite.vim"
NeoBundle "thinca/vim-ref"
NeoBundle "thinca/vim-quickrun"
NeoBundle "mattn/zencoding-vim"
NeoBundle "tpope/vim-markdown"
NeoBundle "scrooloose/nerdtree"
NeoBundle "kmnk/vim-unite-giti"
NeoBundle "fholgado/minibufexpl.vim"
NeoBundle "mattn/webapi-vim"
NeoBundle "tyru/open-browser.vim"
NeoBundle "basyura/twibill.vim"
NeoBundle "basyura/bitly.vim"
NeoBundle "mattn/favstar-vim"
NeoBundle "basyura/TweetVim"
NeoBundle "h1mesuke/unite-outline"
NeoBundle "tomasr/molokai"
NeoBundle "honza/vim-snippets"
NeoBundle "thinca/vim-splash"
NeoBundle "vim-scripts/Wombat"
NeoBundle "Lokaltog/powerline"

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
     \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundleCheck

"ホームディレクトリに移動
cd ~/

" 関数その他

" 全角スペースを強調させるお（＾ω＾ ≡ ＾ω＾）お）
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif

"コマンドモード時にEnterで改行入力
noremap <CR> o<ESC>

" プラグインの設定
 
" NERDTreeの設定
nmap <silent> <C-e>      :NERDTreeToggle<CR>
    vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
    omap <silent> <C-e>      :NERDTreeToggle<CR>
    imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
    cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
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

"neocompleteの設定
let g:acp_enableAtAtartup = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|\.jax\|Log.txt'
let g:neocomplete#enable_ignore_case = 0
let g:neocomplete#enable_smart_case  = 1
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
inoremap <expr><C-e>  pumvisible() ? neocomplete#close_popup() : "<End>"
inoremap <expr><C-c>  neocomplete#cancel_popup()
inoremap <expr><C-u>  neocomplete#undo_completion()
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"0

"neosnippetの設定
imap <C-k>	<Plug>(neosnippet_expand_or_jump)
smap <C-k>	<Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>	neosnippet#expandable()	<Bar><bar>	neosnippet#jumpable() ? "\<Plig>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('cancel')
	set concellevel=2 concealcursor=i
endif

let g:neosnippet#snippets_derectory='$DOTVIM/bundle/vim-snippets/snippets'

let g:unite_enable_start_insert=1
let g:Powerline_symbols = 'fancy'

"TweetVimの設定
nnoremap <silent> s :<C-u>TweetVimSay<CR>

"Unite.vimの設定
nnoremap [unite] <Nop>
nmap <Space>f [unite]
 
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 50
let g:unite_source_file_mru_filename_format = ''
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}
