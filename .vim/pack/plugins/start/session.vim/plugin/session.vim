" プラグイン無効化、二重ロード防止
if exists('g:loaded_session')
  finish
endif
let g:loaded_session = 1

" コマンド定義
command! SessionList call session#sessions()
command! -nargs=1 SessionCreate call session#create_session(<q-args>)


