# 目次

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=3 orderedList=false} -->

<!-- code_chunk_output -->

- [目次](#目次)
- [Issue について](#issue-について)
  - [Fix - バグ修正](#fix---バグ修正)
  - [Fix - 非機能](#fix---非機能)
  - [Feat - 仕様・機能追加](#feat---仕様機能追加)
  - [Pref - 仕様・機能変更](#pref---仕様機能変更)

<!-- /code_chunk_output -->

# Issue について

Issue は「Issue テンプレート」を設定しています。

Issue のタイトルは規定値の後に続けてわかりやすく簡潔な内容を入れてください。  
　例 : 「Fix - バグ修正」の場合  
　　`fix: ○○ API が XX の時に HTTP ステータスコードが 500 になるバグの修正`  
本文の記述方法は各 Issue 作成時に表示される本文の内容に従ってください。

Issue テンプレート毎の用途と、タイトルやラベル等の設定内容は以下の通りです。

## Fix - バグ修正

後方互換性のあるバグ修正  
パッチリリース (v0.0.1 → v0.0.2)

#### テンプレートの規定値

- タイトル
  - "fix: "
- ラベル
  - https://github.com/ambient-lab/ambient-tmpl-root/labels/bug https://github.com/ambient-lab/ambient-tmpl-root/labels/fix https://github.com/ambient-lab/ambient-tmpl-root/labels/patch%20release

## Fix - 非機能

非機能の修正  
パッチリリース (v0.0.1 → v0.0.2)

#### テンプレートの規定値

- タイトル
  - "fix: "
- ラベル
  - https://github.com/ambient-lab/ambient-tmpl-root/labels/fix https://github.com/ambient-lab/ambient-tmpl-root/labels/patch%20release

## Feat - 仕様・機能追加

後方互換性のある機能追加と Readme 更新  
マイナーリリース (v0.0.1 → v0.1.0)

#### テンプレートの規定値

- タイトル
  - "feat: "
- ラベル
  - https://github.com/ambient-lab/ambient-tmpl-root/labels/feat https://github.com/ambient-lab/ambient-tmpl-root/labels/minor%20release

## Pref - 仕様・機能変更

後方互換性のない仕様や機能の修正  
メジャーリリース (v0.0.1 → v1.0.0)

#### テンプレートの規定値

- タイトル
  - "pref: "
- ラベル
  - https://github.com/ambient-lab/ambient-tmpl-root/labels/pref https://github.com/ambient-lab/ambient-tmpl-root/labels/major%20release
