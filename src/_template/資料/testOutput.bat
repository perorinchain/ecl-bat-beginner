REM @ECHO OFFありとなしを試すとPAUSEのときに違いがわかる
REM @ECHO OFF

REM このバッチファイルのフォルダパスを取得
SET THIS_BAT_DIR_PATH=%~dp0
REM リストファイルのパスを引数で取得
SET LIST_PATH=%1

REM 文字化け対策で文字コードを調整
CHCP 932
REM テキストファイルに追加する文字列を指定
SET STRING_TO_ADD=追加文字列

REM この時点で環境変数にどんな値が入っているか確認
ECHO %THIS_BAT_DIR_PATH%
ECHO %LIST_PATH%
ECHO %STRING_TO_ADD%
REM PAUSEのところで一度止まってくれる
PAUSE

IF NOT EXIST %LIST_PATH% EXIT

FOR /F "tokens=*" %%A in (%LIST_PATH%) DO (
  REM この時点で%%Aにどんな値が入っているか確認
  ECHO %%A
  PAUSE
  
  REM この時点で環境変数にどんな値が入っているか確認
  ECHO %THIS_BAT_DIR_PATH%
  ECHO %LIST_PATH%
  ECHO %STRING_TO_ADD%
  PAUSE
  
  REM リストファイルにあるファイル名のファイルに指定した文字列を追記
  ECHO %STRING_TO_ADD% >> %THIS_BAT_DIR_PATH%%%A.txt
)

REM コマンドプロンプトを閉じる
EXIT
