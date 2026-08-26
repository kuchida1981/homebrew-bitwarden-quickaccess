# homebrew-bitwarden-quickaccess

[bw-quickaccess](https://github.com/kuchida1981/bitwarden-quickaccess) 用のHomebrew tapです。

## インストール

```bash
brew tap kuchida1981/bitwarden-quickaccess
brew install --cask bw-quickaccess
```

Homebrew 6以降では、非公式tap経由のCaskを初めて使う際に信頼(trust)の確認が必要です。`brew install`時に案内が出た場合は以下を実行してください。

```bash
brew trust --tap kuchida1981/bitwarden-quickaccess
```

`bw-quickaccess` は現時点でコード署名・notarizedされていません。Homebrew経由でインストールしても、初回起動時にmacOS Gatekeeperの警告が表示されます。対処方法はインストール後に表示されるcaveats(`brew info --cask bw-quickaccess` で再表示可能)を参照してください。

## Caskの更新手順(新しいバージョンをリリースしたとき)

1. 本体リポジトリの最新リリースのタグ名とアセットのsha256を取得する:
   ```bash
   gh release view --repo kuchida1981/bitwarden-quickaccess --json tagName,assets
   ```
   `assets[].digest` フィールドに `sha256:...` の形で含まれている(ダウンロードして自分で計算する必要はない)。
2. `Casks/bw-quickaccess.rb` の `version` と `sha256` を更新する(`version` はタグ名から先頭の `v` を除いたもの)。
3. lintする:
   ```bash
   brew style --cask bw-quickaccess
   brew audit --cask bw-quickaccess
   ```
4. 実際にインストールし直して動作確認する:
   ```bash
   brew reinstall --cask bw-quickaccess
   ```
5. コミット・プッシュする。

現時点ではこの更新は手動です。将来的にGitHub Actions等での自動化を検討する余地がありますが、リリース頻度が低いため当面は手動更新で運用します。
