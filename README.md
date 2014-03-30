mt-plugin-GitHubFlavoredMarkdown
================================

"GitHub Flavored Markdown"書式をサポートします。

## インストール

`plugins/GitHubFlavoredMarkdown`を`MT_DIR/plugins`にコピーすると、エディタに「GitHubFlavoredMarkdown」が追加されます。

![Formatting text with "GitHub Flavored Markdown"](http://i.imgur.com/t04SJ4d.png)

これで記事を構築すると、GFM APIを用いてMarkdownをHTMLに変換し、表示します。

![Hello World](http://i.imgur.com/WrjJcx4.png)

##設定

### 互換APIを使う

GitHubのGFM APIはアクセス制限があるので、実際には[GitHub's Markdown Rendering API compatible API](http://gfm-kyanny.sqale.jp/)([GitHub](https://github.com/kyanny/gfm-rendering-compatible-api))などの互換APIサーバを自前で用意する必要があるでしょう。

互換APIを使うようにするには、`mt-config.cgi`に`GFM_API`設定を追加します。

mt-config.cgi

    GFM_API http://your-gfm-compatible-api-server/markdown/raw

##スタイル

CSSは[Gist: Github Markdown CSS - for Markdown Editor Preview](https://gist.github.com/andyferra/2554919)あたりからダウンロードして使用するとGitHubっぽい見た目になります。

ただし、シンタックスハイライトはスタイルシートがないので機能しないので、何とかしたいところです。（githubのCSSをコピペすることでも一応色分けできますが･･･）

##TODO

- 認証付きリクエストへの対応（API制限上限対策）
- API残り回数チェック
- シンタックスハイライトをなんとかしたい

##Contributing to mt-plugin-GitHubFlavoredMarkdown

Fork, fix, then send me a pull request.

##Copyright

© 2014 Yuichi Takeuchi, released under the MIT license