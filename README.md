# 環境変数設定ファイル

## project.env

- Git で管理しているファイル
  - テンプレートプロジェクトでは Git 管理はしないので、プロジェクト開始時に作成し Git 管理対象に含める
- プロジェクト直下にプロジェクト固有の設定を記述

例）

```toml
# AWS Region
AWS_REGION=ap-northeast-1

# AWS SSO
AWS_SSO_ACCOUNT_ID=XXXXXXXX
AWS_SSO_START_URL=https://XXXXXXXX.awsapps.com/start
AWS_SSO_REGION=ap-northeast-1
AWS_SSO_ROLE_NAME=AdministratorAccess

# AWS MFA
#AWS_MFA_ASSUME_ROLE=arn:aws:iam::XXXXXXXX:role/XXXXXXXX

# VSCode Theme (default Dark+)
IDE_THEME=
```

### project.{envname}.env

`project.prod.env`など環境固有の設定ファイル  
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

### project.env

```toml
AWS_SSO_ACCOUNT_ID=<account_id>
AWS_SSO_START_URL=https://xxxxxxxx/start
AWS_SSO_REGION=<region>
AWS_SSO_ROLE_NAME=<role_name>
```

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

テスト 2
