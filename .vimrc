" NeoBundle 関連の設定
set nocompatible               " be iMproved
filetype off

" 最初に読み込んだ時にだけ必要な処理(path 関連)
if has('vim_starting')
	set runtimepath+=~/.vim
	set runtimepath+=~/.vim/qfixapp
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

runtime! myconf.d/*.vim

" NeoBundle の移動

" 最後に記述する系統のもの
syntax on
