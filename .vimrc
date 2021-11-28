"=======================================================================
"[dein.vim setting] version administration 
"=======================================================================
" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}


"if &compatible
"
"  set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=/home/jt/.vim/dein/repos/github.com/Shougo/dein.vim
"
"" Required:
"call dein#begin('/home/jt/.vim/dein')
"
"" Let dein manage dein
"" Required:
"call dein#add('/home/jt/.vim/dein/repos/github.com/Shougo/dein.vim')
"
"" Add or remove your plugins here like this:
""call dein#add('Shougo/neosnippet.vim')
""call dein#add('Shougo/neosnippet-snippets')
""call dein#add('yegappan/grep')
""call dein#add('LeafCage/vimhelpgenerator')
"
"
"" Required:
""call dein#end()
"
"" Required:
"filetype plugin indent on
"syntax enable
"
"" If you want to install not installed plugins on startup.
""if dein#check_install()
""  call dein#install()
""endif
"
"=======================================================================

"=======================================================================
"[ctags setting] tag_jump func
"=======================================================================

" ルートディレクトリのタグファイルを読み込む
set tags=./tags;,tags;

"=======================================================================

"=======================================================================
"[LeafCage/vimhelpgenerator]
"=======================================================================
let g:vimhelpgenerator_version = ''
let g:vimhelpgenerator_author = 'Author  : LeafCage <leafcage+vim @ gmail.com>'
let g:vimhelpgenerator_contents = {
  \ 'contents': 1, 'introduction': 1, 'usage': 1, 'interface': 1,
  \ 'variables': 1, 'commands': 1, 'key-mappings': 1, 'functions': 1,
  \ 'setting': 0, 'todo': 1, 'changelog': 0
  \ }

"=======================================================================

"=============================
"
" basic setting
"
"=============================

" 行数表示
set number
" 文字コードをUTF-8
set fenc=utf-8
" バッファが編集中でもその他のファイルを開けるように
set hidden
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" 括弧への移動スピード(0.1秒）
set matchtime=1
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" シンタックスハイライトの有効化
syntax enable
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" タブ文字の幅(半角）
set tabstop=4
" 自動インデントに使用する空白の数（半角）
set shiftwidth=2
" 一行の文字を全て表示する
set display=lastline

"------------------------------
" key map setting
"------------------------------

" 行頭に移動
noremap <S-h> ^
" 固定文言を挿入する（デフォルトはphpのdebug）
noremap <S-d> ovardump("hoge");<ESC>
" 行末に移動
noremap <S-l> $

"------------------------------
" etc
"------------------------------

"全角スペースを赤で表示する
autocmd Colorscheme * highlight FullWidthSpace ctermbg=red
autocmd VimEnter * match FullWidthSpace /　/

" 公開カラースキーマの適用
colorscheme molokai 
