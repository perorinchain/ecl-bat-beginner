# Windowsバッチをさわってみよう！

Windowsバッチをちょっと触れるようになるのが目的です！

※以下はWindows10環境で試していますが、他の環境で動かなかったらすみません。
※ディレクトリ＝フォルダと思ってOKです。


## 準備：コマンドプロンプトを開いてみよう！

Windosでコマンドを実行するには、コマンドプロンプトというアプリを使います。コマンドプロンプトは、たとえば以下の方法で開けます。

 - スタートメニューの検索のところで「コマンド」とか「cmd」と打って出てくる「コマンドプロンプト」をクリックして開く。
 - `Windowsキー+R` で「ファイル名を指定して実行」を開いて、「cmd」と入力してEnter or [OK]

※開くときに「管理者として実行」というオプションがあったりしますが、今回は特に使わなくて大丈夫です。管理者の実行権限が必要な場合に使う機能です。

## おためし１：よく使うコマンドを使ってみよう！
### help
これだけでたたくとコマンド一覧、`help [command]` でコマンドの詳細を表示します。
`[command] /?` でもコマンドのヘルプが見られます。コマンドを使うときは、ぜひ `[command] /?` でコマンドの詳細を確認してみましょう！いろいろ書いてます。

### cd
カレントディレクトリ（コマンドプロンプト上で今いるフォルダ）を移動します。こんな感じで、「>」の前が変わることが分かります。
```
C:\>cd C:\work

C:\work>
```

### echo
`echo` の後に書いた文字列を表示します。バッチファイルだと、ログを出したりしたいときとかに使ったりします。
```
C:\work>echo 表示したい文字列
表示したい文字列
```

環境変数（Windowsに定義されている変数）を `echo` したりもできます。環境変数を呼び出すときは「%」で囲みます。たとえば、日付、時刻、Windowsがあるパス、コマンドの終了コードの環境変数を `echo` してみるとこんな感じになります。
```
C:\work>echo %DATE%
2024/04/13

C:\work>echo %TIME%
17:27:58.63

C:\work>echo %windir%
C:\Windows

C:\work>echo %ERRORLEVEL%
0

```

### ipconfig
IPアドレスとかのネットワーク情報を調べたいときに使います。詳細情報を出す `/all` を付けた `ipconfig /all` をよく使います。

### dir
フォルダ配下のファイルやフォルダを表示します。
```
C:\work>dir
 ドライブ C のボリューム ラベルは Windows です
 ボリューム シリアル番号は XXXX-XXXX です

 C:\work のディレクトリ

2024/04/12  21:05    <DIR>          .
2024/04/12  21:05    <DIR>          ..
2024/04/13  13:09    <DIR>          sampleBat_Beginner
2024/04/12  21:05    <DIR>          samplePowerShell_Beginner
               0 個のファイル                   0 バイト
               4 個のディレクトリ  XXXXXXXXXXXXXX バイトの空き領域
```

### mkdir
フォルダを作成します。
C:\workに居る状態でtestフォルダを作成するとこんな感じです。
```
C:\work>mkdir test

C:\work>dir
 ドライブ C のボリューム ラベルは Windows です
 ボリューム シリアル番号は XXXX-XXXX です

 C:\work のディレクトリ

2024/04/13  15:41    <DIR>          .
2024/04/13  15:41    <DIR>          ..
2024/04/13  13:09    <DIR>          sampleBat_Beginner
2024/04/12  21:05    <DIR>          samplePowerShell_Beginner
2024/04/13  15:41    <DIR>          test
               0 個のファイル                   0 バイト
               5 個のディレクトリ  XXXXXXXXXXXXXX バイトの空き領域
```

### find、findstr
ファイルから文字列を検索します。
findとfindstrでは、検索のやり方とか結果がちょっと違うのでヘルプで確認してみください！
```
C:\work>find "test" test.txt

---------- TEST.TXT
testmojiretsu
```
```
C:\work>findstr "test" test.txt
testmojiretsu
```

### set
自前の環境変数を設定します。`set` だけだと環境変数の一覧が表示されます。
「test」という文字列を入れた「TEST_STRING」という名前の環境変数を設定してみると、こんな感じになります（最初は定義されていないので、「%TEST_STRING%」という文字列が `echo` されます）。
```
C:\work>echo %TEST_STRING%
%TEST_STRING%

C:\work>set TEST_STRING=test

C:\work>echo %TEST_STRING%
test

```

### copy、xcopy、robocopy
ファイルやフォルダをコピーします。
copy、xcopy、robocopyの順に機能が強くなっていく感じです。一番シンプルなcopyをやってみるとこんな感じです。
```
C:\work>dir /A-D /B
test.txt

C:\work>copy test.txt test2.txt
        1 個のファイルをコピーしました。

C:\work>dir /A-D /B
test.txt
test2.txt
```

### start
プログラムやコマンドを別ウィンドウで実行します。たとえば、以下でメモ帳を開きます。
```
C:\work>start notepad

```

### exit
コマンドプロンプトを終了します。


## おためし２：簡単なバッチを作成してみよう！

### お題①：
以下の動きをするバッチファイルを作成してみましょう！
1. テンプレートのフォルダをコピペして日付名フォルダを作成する
2. コピーしたテンプレート内にあるテキストファイル名にも日付を付ける
3. ファイル名に日付を入れたテキストファイルをメモ帳で開く

### お題②：
以下の動きをするバッチファイルを作成してみましょう！（その２）
1. 引数で渡したパスのリストファイルを読み込む
2. 読み込んだリストファイルに書かれたファイル名のファイルに文字列を追加する


## おためし３：作ったバッチをカスタマイズしてみよう！
おためし２で作ったバッチファイルの不便なところを改善したり、機能を追加したり改造してみましょう！

ここに出てこなかったコマンドやオプションもぜひ試してみてください！作り方もググると結構出てきます！

