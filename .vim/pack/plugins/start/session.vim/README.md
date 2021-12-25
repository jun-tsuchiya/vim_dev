
使い方						*session-usage*
事前準備:セッションファイルの格納先をvimrcで設定

1.SessionCreate 【セッションファイル名】でセッションを保存
2.SessionListで保存したセッション一覧を確認して復元したいセッションを選択してエンター
3.プラグインを無効化する場合は.vimrcに固定値を追加すること
固定値↓
let g:loaded_session = 1

