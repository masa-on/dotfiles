if !exists('loaded_matchit')
	runtime macros/matchit.vim
endif

" 画面関連
set nowrap
set number
set cmdheight=2
set laststatus=2
set scrolloff=5
set guioptions-=T
set guioptions-=r

" set cursorline
set tabstop=2
set shiftwidth=2
set noexpandtab
set softtabstop=0

set smartindent

" set clipboard+=unnamed
" set clipboard=unnamed

" ファイル関連の設定
set hidden
set autoread
set confirm
set switchbuf=useopen
" ファイルエンコーディング、内部エンコードは変更しない
set fenc=utf-8
set fileencodings=utf-8,cp932,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,euc-jp,eucjp-ms

set history=10000
set showcmd
set noundofile

if has('win64') || has('win32')
	set shell=powershell.exe
endif

" 検索関連の設定
set is
set hls
set ignorecase
set smartcase
set gdefault

set matchtime=3
set shellslash

" バックアップ関連
set noswapfile
set nowritebackup
set nobackup

" コマンドライン補完
set wildmenu
set wildmode=longest:full,full
" 見た目関連の設定
colorscheme desert

if has('unix') || has('mac')
	set guifont=Ricty\ 12
endif

" タブラインの表示を改良
function! GuiTabLabel()
  " タブで表示する文字列の初期化をします
  let l:label = ''

  " タブに含まれるバッファ(ウィンドウ)についての情報をとっておきます。
  let l:bufnrlist = tabpagebuflist(v:lnum)

  " 表示文字列にバッファ名を追加します
  " パスを全部表示させると長いのでファイル名だけを使います 詳しくは help fnamemodify()
  let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
  " バッファ名がなければ No title としておきます。ここではマルチバイト文字を使わないほうが無難です
  let l:label .= l:bufname == '' ? 'No title' : l:bufname

  " タブ内にウィンドウが複数あるときにはその数を追加します(デフォルトで一応あるので)
  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= '[' . l:wincount . ']'
  endif

  " このタブページに変更のあるバッファがるときには '[+]' を追加します(デフォルトで一応あるので)
  for bufnr in l:bufnrlist
    if getbufvar(bufnr, "&modified")
      let l:label .= '[+]'
      break
    endif
  endfor

  " 表示文字列を返します
  return l:label
endfunction

set guitablabel=%N:\ %{GuiTabLabel()}

" ビープ音
set visualbell t_vb=

" キーマップ関連の設定
" <Leader> の設定
nnoremap \ ,
nnoremap g\ g,
let mapleader = ','

" .vimrc の編集用キーマップ
nnoremap <Leader>rr
			\ :<C-u>source<Space>$MYVIMRC<CR>
nnoremap <Leader>..
			\ :<C-u>tabnew<Space>~/.vim/myconf.d/00_NeoBundle.vim<CR>

" Session 関連のキーマップ
aug Session
	au!
	au VimLeave * mks! ~/.vim.session
aug END
command! -nargs=0 Vis source ~/.vim.session

" 新規作成したファイルのエンコーディング
aug new_file_encoding
	au!
	au BufNewFile * setl fenc=utf-8
aug END

" vimgrep 後に自動でQuickFixを開く
augroup grepopen
	autocmd!
	autocmd QuickFixCmdPost vimgrep cw
augroup END

" Help バッファを q で終了できるように
aug help_type
	au!
	au Filetype help nnoremap <buffer>q :<C-u>q<CR>
aug END

" Esc 連打で, 一時的にハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" カレントディレクトリの変更
nnoremap <Leader>c :<C-u>cd<Space>%:p:h<CR>

" ヴィジュアルモードでのインデント
vnoremap < <gv
vnoremap > >gv
" vnoremap p "0p 

nnoremap <M-]> g<C-]>

" ファイルタイプ別の設定
" aug MyAutoGroup
" 	au!
" 	au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" aug END

" プラグインごとの設定
" matchit の設定
let b:match_ignorecase=1
" emmet の言語設定
let g:user_emmet_settings = {'lang' : 'ja' }
" operator-replace の設定
map _ <Plug>(operator-replace)
" QFixHowm の設定
let howm_dir = '~/.vim/qfix'
if has('unix') 
	let howm_fileencoding = 'utf-8'
	let howm_fileformat = 'unix'
elseif has('mac')
	let howm_fileencoding = 'utf-8'
	let howm_fileformat = 'mac'
else
	let howm_fileencoding = 'cp932'
	let howm_fileformat = 'dos'
endif
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.mkd'
let QFixHowm_FileType = 'markdown'
let QFixHowm_Title = '#'

" open-browser の設定
noremap gO <Plug>(openbrowser-smart-search)
" Unite.vim の設定
nnoremap [unite] <Nop>
nmap <Leader>u [unite]

nnoremap [unite]u :<C-u>Unite -no-split<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer_tab<Space>bookmark<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
nnoremap <silent> [unite]G :<C-u>UniteResume<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]t :<C-u>Unite tag<CR>

" VimFiler の設定
nnoremap [vimfiler] <Nop>
nmap <Leader>f [vimfiler]

nnoremap <silent> [vimfiler]e
			\ :<C-u>VimFilerSplit<Space>-winwidth=30<CR> 
nnoremap <silent> [vimfiler]f
			\ :<C-u>VimFiler<CR>
" nnoremap <silent> [vimfiler]b
" 			\ :<C-u>VimFilerBufferDir<Space>-winwidth=30<Space>-split<CR> 
nnoremap <silent> [vimfiler]b
			\ :<C-u>VimFilerBufferDir<CR> 
" 初めから、編集可能モードで開く
let g:vimfiler_safe_mode_by_default = 0

" NeoComplete 系統の設定
if neobundle#is_installed('neocomplete')
	" まず、標準の補完を潰しておく
	let g:acp_enableAtStartup = 0
	" その後で NeoCompleteの設定
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
	" neocomplcache 用の設定
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_ignore_case = 1
	let g:neocomplcache_enable_smart_case = 1
	if !exists('g:neocomplecache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns._ = '\h\w*'
	let g:neocomplcache_enable_camel_case_completion = 1
	let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Windows 用 QuickRun の設定
if has('win32') || has('win64')
	function! s:hook_quickrun_windows()
		let l:hook = {
					\    'name' : 'myHook',
					\    'kind' : 'hook',
					\}

		function! l:hook.init(session)
			set noshellslash
		endfunction

		function! l:hook.sweep()
			set shellslash
		endfunction

		call quickrun#module#register(l:hook)
		" autocmd MYAUTOCMD FileType quickrun setl ff=dos

	endfunction

	call s:hook_quickrun_windows()
endif
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = { 'outputter' : 'browser' }

" Haskell 系統の設定

" タブページについての設定 うまいこといかないのでまた今度
" タブラインなどで検索して、好みの設定をすること

