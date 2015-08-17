# ruby_twitterCounter

このプログラムはキーワードを入力してツイート数をカウントするWebアプリケーションです。
ただし、Twitter APIの制約から数週間以上のツイートを取得することができないので、数日中にツイートされたものに限られます。

オープンソースカンファレンス Shimaneの企画のために作ったもので、もし同じようなことをされたい方がおられたらご利用ください。

## 設定

### Twitter APIの準備

Twitter APIを利用するには以下のサイトでユーザー登録およびアプリケーションの設定が必要です。

https://dev.twitter.com

### アプリケーションのキーを設定

twitter.rbにある[your key]と[your secret]にアプリケーションの情報を設定してください。

### Rubyの設定

Rubyが動作するように設定し、以下のコマンドでgemをインストールします。

gem install twitter

### Apacheの設定

htaccessの上書きを有効にして下さい。
