# 目次 {ignore=true}

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=1 orderedList=false} -->

<!-- code_chunk_output -->

- [関連テンプレートリポジトリの README インデックス](#関連テンプレートリポジトリの-readme-インデックス)
- [GitHub におけるリポジトリ作成について](#github-におけるリポジトリ作成について)
- [テンプレートリポジトリについて](#テンプレートリポジトリについて)
- [利用するシェルについて](#利用するシェルについて)
- [環境変数設定について](#環境変数設定について)
- [環境構築](#環境構築)
- [GitHub リポジトリのチーム権限について](#github-リポジトリのチーム権限について)
- [リポジトリのソースコード運用について](#リポジトリのソースコード運用について)
- [Commit について](#commit-について)
- [プルリクエストについて](#プルリクエストについて)
- [fork 元の取り込みについて](#fork-元の取り込みについて)
- [テンプレートリポジトリの取り込みについて](#テンプレートリポジトリの取り込みについて)
- [バージョニングについて](#バージョニングについて)
- [Issue について](#issue-について)
- [python のバージョンアップデートについて](#python-のバージョンアップデートについて)

<!-- /code_chunk_output -->

# 関連テンプレートリポジトリの README インデックス

関連しているテンプレートリポジトリの README に関する概要やリンクを記載しています。

- [ambient-tmpl-root](.devcontainer/features/root/README.md)
  - 最上位のテンプレートリポジトリ。

# GitHub におけるリポジトリ作成について

テンプレートリポジトリを利用したリポジトリ作成については
[README](doc/github/README.md)を参照してください。

# テンプレートリポジトリについて

- GitHub で管理するリポジトリのテンプレートです。
- Docker コンテナの構築ソースも含んでおり、プロジェクトソースを VSCode で開くことでプロジェクト毎に Docker コンテナが構築できるようにしています。(DevContainer)

## テンプレートリポジトリの種類

### 各リポジトリの関係

```bash
ambient-tmpl-root
├── ambient-tmpl-web
│   ├── ambient-tmpl-web-tw
│   │   └── {プロジェクト名}-web
│   └── ambient-tmpl-web-mui
│       └── {プロジェクト名}-web
├── ambient-tmpl-app
│   　└── {プロジェクト名}-app
└── ambient-tmpl-infra
    └── {プロジェクト名}-infra
```

### [Root テンプレート](https://github.com/ambient-lab/ambient-tmpl-root)

基本 OS のテンプレート

### [Web テンプレート](https://github.com/ambient-lab/ambient-tmpl-web)

**ambient-tmpl-root** を fork して作られた Web システムの開発テンプレート

- React: フロントエンドフレームワーク
- Amplify: バックエンドフレームワーク

### [Web TW テンプレート](https://github.com/ambient-lab/ambient-tmpl-web-tw)

**ambient-tmpl-web** を fork して作られた Web システムのテンプレート

デザインを重視する場合は UI コンポーネントに [Tailwind CSS](https://tailwindcss.com/) を利用しているこちらのテンプレートを利用する

- Tailwind CSS: UI コンポーネント

### [Web MUI テンプレート](https://github.com/ambient-lab/ambient-tmpl-web-mui)

**ambient-tmpl-web** を fork して作られた Web システムのテンプレート

管理画面などデザインを重視しない場合は UI コンポーネントに [Material UI](https://mui.com/) を利用しているこちらのテンプレートを利用する

- Material UI(MUI): UI コンポーネント

### [App テンプレート](https://github.com/ambient-lab/ambient-tmpl-app)

**ambient-tmpl-root** を fork して作られた [Expo](https://expo.dev/) を利用するスマホアプリシステムのテンプレート

PoC 開発などデザインを重視しない場合は MUI を利用する

- ReactNative: フロントエンドフレームワーク
- Expo: ReactNative の拡張ツール
- Amplify: バックエンドフレームワーク
- MUI: UI コンポーネント （※要件的に MUI が許容できる場合)

### [Infra テンプレート](https://github.com/ambient-lab/ambient-tmpl-infra)

**ambient-tmpl-root** を fork して作られたインフラ構築のテンプレート
インフラや API、バッチなどの UI が伴わない開発に利用する

- [AWS CDK](https://docs.aws.amazon.com/ja_jp/cdk/v2/guide/getting_started.html): IaC(Infrastructure as Code)
- [AWS SAM](https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/serverless-getting-started.html): サーバーレスアプリケーションを構築

## リポジトリの可視性 (≒ アクセス権限)

リポジトリの可視性は次の中から選択します

- public
  - 公開リポジトリ  
    インターネット状の誰でもアクセス可能
- private
  - 非公開リポジトリ  
    リポジトリ作成者とアクセス権を有するユーザがアクセス可能  
    Organization リポジトリの場合はその Organization メンバーがアクセス可能
- internal
  - 内部リポジトリ  
    Enterprise メンバーが読み取り権限でアクセス可能  
    Github Enterprise Cloud 利用時のみ作成可能

### internal を選択するケース

internal は「インナーソース」のワークフロー構築を目的として設定します

インナーソースとは、ソフトウェア開発のコンセプト  
オープンソースソフトウェアの原則を企業や組織の内部に適用するアプローチ  
開発プロセスをオープンでコラボレーション重視にすることで開発効率と品質の向上が期待できます

**専用テンプレート/リファレンスリポジトリはインナーソースと親和性が高いので internal を推奨する**

# 利用するシェルについて

デフォルトシェルは`zsh`を利用します。

# 環境変数設定について

Codespaces の暗号化されたシークレットを利用して シークレット情報（環境変数）を読み込みます。

従来だと、 Codespaces のビルド後に、`.env`ファイルを用意して参照する運用としていましたが、リポジトリ単位で Codespaces に設定したシークレット情報を参照するようにします。

## Codespaces secrets 設定内容

- AWS_REGION: `ap-northeast-1`
- AWS_SSO_ACCOUNT_ID: `xxxxxxxxxx`
- AWS_SSO_REGION: `ap-northeast-1`
- AWS_SSO_ROLE_NAME: `AdministratorAccess`
- AWS_SSO_START_URL: `https://xxxxxxxxxx.awsapps.com/start`

### AWS MFA パターン

MFA での認証をする場合にも、Codespaces のシークレット情報（環境変数）を設定して読み込みます。

- AWS_MFA_ASSUME_ROLE: `arn:aws:iam::<account_id>:role/<role＿name>`
- AWS_MFA_ACCESS_KEY_ID: `<access_key_id>`
- AWS_MFA_SECRET_ACCESS_KEY: `<secret_access_key>`
- AWS_MFA_DEVICE=arn:aws:iam:: `<account_id>:mfa/<user_name>`

## user.env

- Git で管理していないファイルなので手動で作成
- プロジェクト直下に個人の設定を記述
- 最低限以下の Git ユーザーの情報を記述

```toml
GIT_USER_EMAIL=<user_email>
GIT_USER_NAME=<user_name>
```

### AWS Credentials パターン

## user.env

```toml
AWS_SECRET_ACCESS_KEY=<access_key_id>
AWS_SECRET_KEY=<secret_access_key>
```

# 環境構築

## 前提説明

GitHub が VSCode の環境をホストして提供してくれるクラウドサービスの [Codespaces](https://github.co.jp/features/codespaces) を利用して環境構築を行います。

Codespaces を利用するメリットとして下記があります。

- オンラインの開発環境であり、自分でローカルに環境を用意する必要がない
- ブラウザからアクセスでき、いつでもどこでも開発可能
- セットアップが簡単
- セキュリティが高く自分のデバイス上で開発するよりも安全

### Codespaces 起動手順

1. Project から Issue を作成

- リポジトリごとに Project を用意するため Project で機能開発やバグ修正などを管理します。
- Project にて、Issue を起票し、下記の通りどういったことをするのかタイトルや説明を追記します。
- ※ Issue が一つも存在しない場合は Project にリポジトリが表示されていないので、リポジトリの Issue ページから Issue を起票してください。
  <img src="doc/images/github/001.png">
  - `.github/ISSUE_TEMPLATE配下に`に issue 起票のテンプレートを用意してます。
    ```
    .github
      ├── dependabot.yml
      └── ISSUE_TEMPLATE
          ├── bug_report.md
          ├── custom.md
          └── feature_request.md
    ```
- Issue を起票後、issue からブランチを作成します。下記の通り feature ブランチと codespace の起動も行います。
  <img src="doc/images/github/002.png">
  <img src="doc/images/github/003.png">

2. Codespace 起動
   Codespace が起動すると下記の通りのようにホストされます。
   <img src="doc/images/github/004.png">
3. AWS の認証コマンド

下記コマンドで認証

```bash
$ make login
```

# GitHub リポジトリのチーム権限について

| チーム名     | 権限設定 | 権限説明                                              |
| ------------ | -------- | ----------------------------------------------------- |
| xxxx-private | Maintain | develop,main ブランチへのプルリクエストのマージが可能 |
| xxxx-public  | Write    | develop,main ブランチへのプルリクエストのマージが不可 |

# リポジトリのソースコード運用について

## リポジトリサイズの制限

https://docs.github.com/ja/repositories/working-with-files/managing-large-files/about-large-files-on-github#repository-size-limits

> リポジトリは小さく保ち、理想としては 1GB 未満、および 5GB 未満にすることを強くお勧めします。リポジトリが小さいほど、クローン作成が速く、操作やメンテナンスが簡単になります。

# Commit について

## 注意事項

**※`develop`や`main`ブランチへの直 Push は禁止します。(できないようにしています。)**  
必ず作業ブランチを切ってプルリクエストを作って、コードレビュー後にマージする運用とします。

## コミットメッセージのルール

開発者同士でコミット履歴を見やすくするためメッセージに規則性を持たせるよう、commit メッセージテンプレートを使って commit します。

詳しくは[github-tag-action のコミットメッセージの規則](#コミットメッセージの規則)に従ってください

## 優れた Git コミットメッセージの 7 つのルール

How to Write a Git Commit Message: https://cbea.ms/git-commit/

1. **件名と本文を空行で区切る**
2. **件名は 50 文字以内までにする**
3. **件名は大文字で始める**
4. **件名をピリオドや句読点で終わらせない**
5. **件名は命令形な雰囲気で使用する**
6. **本文を 72 文字ごとに改行する**
7. **本文を使用して、何を、なぜ、どのようにしたかを記述する**

## コミットメッセージの自動チェック

git Hooks を使ってコミット時にコミットメッセージの自動チェックをしています。  
下記のように、issue 番号を含めてないメッセージはコミットを取り消すように設定しています。

```bash
❯ git commit -m "テスト"
🪝 Running Git Hooks: commit-msg
 - issue番号の存在チェック: NG
================================================================
コミットメッセージにissue番号が含まれていません。

Example: #1234
================================================================

Git Hooks: commit-msg: NG

❯
```

# プルリクエストについて

- 作業ブランチから `develop`ブランチへプルリクエストを作成します。
- プルリクエストのマージについては最低 1 人以上のコードレビューがされないとマージできません。

## プルリクエストのマージ手法

GitHub にて用意されてるいずれかのプルリクエスト手法に基づいてコードレビュー者はマージできます。
開発者などで相談してマージ手法を決めて運用してください。

- マージコミット
  - 利点: 複数ブランチ・複数開発者のコミット変更履歴が残るため明確になる。
  - 欠点: 変更履歴が増えるので、リポジトリサイズが大きくなる
- スカッシュマージ
  - 利点: ブランチの変更履歴をコンパクトにしたい場合、有効なマージ手法
  - 欠点: 変更履歴が 1 つのコミットのため、変更の追跡やデバッグ時が困難
- リベースとマージ
  - 利点: マージ後の履歴をキレイに保てる、変更の適応順序や履歴の整理に適している手法
  - 欠点: リベース操作でブランチ履歴が書き換えられる。コンフリクトが起きると面倒。

# fork 元の取り込みについて

詳細は[こちら](doc/readme/merge/fork-template.md)

# テンプレートリポジトリの取り込みについて

詳細は[こちら](doc/readme/merge/template.md)

# バージョニングについて

互換性管理のため[セマンティックバージョニング](https://semver.org/lang/ja/)を採用しています  
バージョンは`メジャー.マイナー.パッチ`形式です  
プレリリース,ビルドナンバーなどのバージョン形式の拡張も可能ですが利用しません

## ルール

次のルールに従ってバージョンナンバーを管理してください

- `メジャー`
  - 互換性のない変更をした場合にインクリメントする
  - インクリメント時はマイナーとパッチを 0 にする
- `マイナー`
  - 後方互換性のある機能性を追加した場合にインクリメントする
  - インクリメント時はパッチを 0 にする
- `パッチ`
  - 後方互換性のあるバグ修正をした場合にインクリメントする

その他のルール

- メジャーバージョンの 0 は初期開発段階
  - 互換性のない変更がマイナー、パッチバージョンアップに含まれる可能性があります
- 各バージョンナンバーは正の整数で、先頭を 0 で埋めません
- いかなる修正であってもバージョンを上げます

## 指針

API やライブラリ・ツール等、他のシステムから利用してもらう場合や、フォークやテンプレートされるシステムではセマンティックバージョニングの[ルール](#ルール)を遵守してください

Web サイト等の人が使うシステムでは以下の方針に従ってバージョンナンバーを管理してください

- `メジャー`
  - UI の大幅な変更(リニューアル等)
- `マイナー`
  - 機能性の追加
- `パッチ`
  - バグの修正

## Github での運用方法

バージョンナンバーは、接頭辞「v」を追加した**タグ**で管理します  
タグとリリースノートの作成は Github Actions によって自動化されます

### GitHub Actions について

#### [github-tag-action](https://github.com/mathieudutour/github-tag-action)

##### 実行トリガー

main ブランチへの push

##### 処理概要

- コミットメッセージの規則に従ってバージョンナンバーを決定してタグを作成します
- コミットメッセージの優先順位は `メジャー` > `マイナー` > `パッチ`で、1 つだけがインクリメントされます
- バージョンに関する情報が含まれていない場合はパッチバージョンをインクリメントします

##### コミットメッセージの規則

```
<type>[optional scope]: <description>

[optional body]
```

<!-- [optional footer(s)]は省略 -->

- type
  - リリース種別　インクリメント対象
  - `perf`＝メジャーリリース
  - `feat`＝マイナーリリース
  - `fix`＝パッチリリース
- description
  - コミットメッセージの件名
- body
  - コミットメッセージの本文

##### コミットメッセージ例

パッチリリース (1.2.3 -> 1.2.4)

```
fix: Bug Fix A
```

マイナーリリース (1.2.3 -> 1.3.0)

```
feat: Add B

機能Bを追加する
```

#### [release-action](https://github.com/ncipollo/release-action)

##### 実行トリガー

github-tag-action の処理後

##### 処理概要

- リリースを作成します
- リリース件名はタグ、本文は前のタグ以降の変更ログとなります

# Issue について

詳細は[こちら](doc/readme/issue/usage.md)

# python のバージョンアップデートについて

詳細は[こちら](doc/readme/python/update.md)
