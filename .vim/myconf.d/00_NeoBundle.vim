call neobundle#begin(expand('~/.vim/bundle/'))
" originalrepos on github
" Shougo 
NeoBundle 'Shougo/neobundle.vim'
if has('mac') || has('unix')
	NeoBundle 'Shougo/vimproc', {'build' : {
				\		'mac' : 'make -f make_mac.mak',
				\		'unix' : 'make -f make_unix.mak',
				\ }}
elseif has('win32')
	NeoBundle 'Shougo/vimproc'
endif
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplecache'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
" Unite 関連 (汎用)
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'osyo-manga/unite-quickfix'

" kana 
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'kana/vim-filetype-haskell'


NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'

NeoBundle 'h1mesuke/vim-alignta'
" コマンドラインで Emacs 風味 現時点で、 Esc 問題あり
" 日本語を検索できなくなる問題あり
" NeoBundle 'houtsnip/vim-emacscommandline'

" プログラミング言語の補助プラグイン
" Haskell 関連のプラグイン
NeoBundle 'dag/vim2hs'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'cohama/the-ocamlspot.vim'

" Lisp環境
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'VimClojure'
" Web言語
NeoBundle 'pangloss/vim-javascript'
" マークダウン
NeoBundle 'rcmdnk/vim-markdown'
" カラースキーマ
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'https://bitbucket.org/kovisoft/slimv'

" Ruby , Rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'basyura/unite-rails'

call neobundle#end()
filetype plugin indent on     " required!

NeoBundleCheck
" NeoBundle はここまで

