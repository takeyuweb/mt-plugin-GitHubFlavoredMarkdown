mt-plugin-GitHubFlavoredMarkdown
================================

"GitHub Flavored Markdown"書式をサポートします。

## インストール

`plugins/GitHubFlavoredMarkdown`を`MT_DIR/plugins`にコピーすると、エディタに「GitHubFlavoredMarkdown」が追加されます。

![Formatting text with "GitHub Flavored Markdown"](http://i.imgur.com/t04SJ4d.png)

これで記事を構築すると、GFM APIを用いてMarkdownをHTMLに変換し、表示します。

![Hello World](http://i.imgur.com/WrjJcx4.png)

## 設定

### 認証

デフォルトでは匿名モードでGFM APIを利用します。しかしながら、GitHub公式のGFM APIは、匿名モードではクライアントIPアドレスにつき60回/時の利用制限があり、現実的には使えません。

本プラグインはシステムのプラグイン一覧画面より、APIのURL（※後述の互換APIを利用する際に設定）および、匿名モードのON/OFF、匿名でない場合に使用する認証情報を設定できます。

通常、以下のように設定して下さい。

項目 | 値
------------ | -------------
匿名モード | はい
APIユーザー名 | GitHubのログインユーザー名
APIパスワード | GitHubのログインパスワード


### 互換APIを使う

GitHubのGFM APIはアクセス制限があるので、実際には[GitHub's Markdown Rendering API compatible API](http://gfm-kyanny.sqale.jp/)([GitHub](https://github.com/kyanny/gfm-rendering-compatible-api))などの互換APIサーバを自前で用意する必要があるでしょう。

互換APIを使うようにするには、「GFM API」設定を変更します。

項目 | 値
------------ | -------------
GFM API | http://your-gfm-compatible-api-server/markdown/raw


##スタイル

CSSは[Gist: Github Markdown CSS - for Markdown Editor Preview](https://gist.github.com/andyferra/2554919)あたりからダウンロードして使用するとGitHubっぽい見た目になります。

ただし、シンタックスハイライトはスタイルシートがないので機能しないので、何とかしたいところです。（githubのCSSをコピペすることでも一応色分けできますが･･･）

##TODO

- キャッシュ対応によるAPI利用制限緩和
- ダイナミックパブリッシング対応
- API残り回数チェック
- シンタックスハイライトをなんとかしたい

##Contributing to mt-plugin-GitHubFlavoredMarkdown

Fork, fix, then send me a pull request.

##Copyright

© 2014 Yuichi Takeuchi, released under the MIT license