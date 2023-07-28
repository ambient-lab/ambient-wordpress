# 環境変数設定について

Cosespaces の暗号化されたシークレットを利用して シークレット情報（環境変数）を読み込みます。
従来だと、Cosespaces のビルド後に、`.env`ファイルを用意して参照する運用としていましたが、リポジトリ単位で Cosespaces 　に設定したシークレット情報を参照するようにします。

## Codespaces secrets 設定内容

- AWS_REGION
- AWS_SSO_ACCOUNT_ID
- AWS_SSO_REGION
- AWS_SSO_ROLE_NAME
- AWS_SSO_START_URL

環境固有のシークレット情報に関しては、 `PRD_AWS_REGION` や `STG_AWS_REGION`など の接頭辞として Cosespaces のシークレット情報を設定します。
特定環境でデプロイ先が変わる場合などに利用

## user.env

- Git で管理していないファイルなので手動で作成
- プロジェクト直下に個人の設定を記述
- 最低限以下の Git ユーザーの情報を記述

```toml
GIT_USER_EMAIL=<user_email>
GIT_USER_NAME=<user_name>
```

# AWS 認証パターン別の環境変数の設定

## AWS SSO パターン

## AWS Credentials パターン

### user.env

```toml
AWS_SECRET_ACCESS_KEY=<access_key_id>
AWS_SECRET_KEY=<secret_access_key>
```

## AWS MFA パターン

### project.env

```toml
AWS_MFA_ASSUME_ROLE=arn:aws:iam::<account_id>:role/<role＿name>
```

### project.env

```toml
AWS_MFA_ACCESS_KEY_ID=<access_key_id>
AWS_MFA_SECRET_ACCESS_KEY=<secret_access_key>
AWS_MFA_DEVICE=arn:aws:iam::<account_id>:mfa/<user_name>
```

# GitHub のリポジトリ設定

### user.env

```toml
GITHUB_REMOTE_ORIGIN_URL=https://<user_name>:<access_token>@github.com/<organization_name>/<repository_name>.git
```

# AWS の認証コマンド

下記コマンドで認証

```bash
$ make login
```

# AWS の認証コマンド (本番環境)

```bash
$ make login ENV=prod
```
