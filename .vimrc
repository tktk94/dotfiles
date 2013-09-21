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
set rtp+=~/dotfiles/vundle/
call vundle#rc('$DOTVIM/bundle')
Bundle 'gmarik/vundle'
filetype plugin indent on

" vim-scripts上のプラグイン
Bundle "grep.vim"
Bundle "lua-support"

" github上のプラグイン
Bundle "Shougo/neocomplecache"
Bundle "Shougo/neosnippet"
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
Bundle "tomasr/molokai"
Bundle "honza/vim-snippets"
Bundle "thinca/vim-splash"
Bundle "vim-scripts/Wombat"

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

"GUIの設定
"colorscheme molokai
colorscheme Wombat
set guifont=Migmix_2M:h10
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

"neocomplecacheの設定
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"neosnippetの設定
imap <C-k>	<Plug>(neosnippet_expand_or_jump)
smap <C-k>	<Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>	neosnoppet#expandable()	<Bar><bar>	neosnippet#jumpable() ? "\<Plig>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('cancel')
	set concellevel=2 concealcursor=i
endif

let g:neosnippet#snippets_derectory='$DOTVIM/bundle/vim-snippets/snippets'
