REM テンプレートファイルのパスを設定
SET TEMPLATE_PATH="C:\work\sampleBat_Beginner\src\_template"
REM ファイル名に入れるyyyyMMddを設定
SET TODAY_YYYYMMDD=%DATE:/=%

REM テンプレートのフォルダを、配下含めてコピーして日付フォルダを作成
XCOPY /E /I %TEMPLATE_PATH% "C:\work\sampleBat_Beginner\src\%TODAY_YYYYMMDD%"
REM コピーしたフォルダに移動
CD %TODAY_YYYYMMDD%
REM メモのファイル名を日付ファイルに変更
RENAME "memo_yyyyMMdd.txt" "memo_%TODAY_YYYYMMDD%.txt"

REM メモ帳でメモファイルを開く
START notepad "memo_%TODAY_YYYYMMDD%.txt"

REM コマンドプロンプトを閉じる
EXIT
