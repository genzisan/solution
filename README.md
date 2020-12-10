# README

### アプリケーション名

# solution

## 概要

- ユーザーの悩みを解消することを目的としたアプリケーションになっています。
悩みを質問or相談形式で悩みのカテゴリーを選択し、ツイート形式で投稿でき、
そのツイートに対して他のユーザーもコメントすることが出来ます。
悩みは自分自身で解決出来ないことが大半であり、
他のユーザーの客観的なアドバイスや経験を得ることにより悩みの解決に繋がったり、
精神的不安が軽減されることを目的としています。


## 本番環境URL

https://solution-31678.herokuapp.com/
18.180.58.213 （ポート番号ですが、そのままwebページで入力して頂けれな使用可能です）
(EC2デプロイ済みですが、またドメイン化されていないのでドメイン化予定です)

## 制作背景

- どんな経済状況や環境であっても生きている以上は悩みは尽きないと思い、
悩み解決が出来るプラットフォームを作成しました。
ビジネスにおいても悩みを解決することが根幹となっている感じ、
自分が実際に手を動かしてアプリケーションを作成することで悩みをどのようにして解決するのか？
を自分で考え、形に出来ることで今後どのようなアプリケーション作成においても活きてくる経験、知識と感じたのでこのようなアプリケーションを作成しました。

## Basic認証
 
- ユーザー名『test』
- パスワード 『1234』

## ログインテストユーザー

- ユーザー名 『テスト』, メールアドレス 『aaa@aaa』, パスワード『aaa111』
- ユーザー名 『テスト太郎』, メールアドレス 『bbb@bbb』, パスワード『bbb111』

## 利用方法

- 『新規登録』ボタンから必要情報を入力することでユーザー登録ができます。
ログアウト時も新規登録時に入力頂いた『メールアドレス』『パスワード』を入力することによりログイン出来ます。

- 『相談する』を押して頂くと『カテゴリー』が選択でき、テキストボックスをクリックして頂くと文字入力が出来ますので、質問or相談内容をご記入ください。
投稿が完了するとトップページに推移し、ツイートしたユーザー名、ツイートに対するコメント内容が一覧で表示されます。ツイート内容をクリックして頂くとツイートに関する詳細ページへ推移します。

- 詳細ページには、
・ツイートしたユーザー名
・ツイートに対するコメント一覧表示
・コメントテキストボックス
・ツイート編集、解除ボタン（ツイートした本人のみ）
・ツイート、コメントしたユーザー名
が一覧で表示されます。

- 詳細ページ各種機能説明
・ツイート、コメントのユーザー名をクリックして頂くと該当のユーザー詳細ページへ推移します
・コメントテキストボックスをクリックして頂くと、ツイートに対してコメントを残すことが出来ます
・ツイートした本人のみ編集、解除が可能です

- ユーザー詳細ページ
ユーザー詳細ページはユーザーが今までツイートした内容が一覧で表示され、
新規登録時に入力して頂いた内容が一覧で表示されます。

## 要件定義

- https://docs.google.com/spreadsheets/d/1pkGS25uuknznVuT4PUh1kmQRhHRpvEa6YPDtfEo-kJ8/edit?usp=sharing

## 実装した機能のGIF動画と説明

### トップページ全体象

- https://gyazo.com/05c880f96ec65736d42554820df1b788

### 新規登録ページ

- https://gyazo.com/0686127f167b6c742de116a5b42577d7

### ログインページ

- https://gyazo.com/57cb06590933cea21b3438ae97624864

### 相談ページ

- https://gyazo.com/17143c93ca62f29fbbc27ce489206854

### ツイート詳細ページ

https://gyazo.com/71b1145a895e873f60128dcc08e59105

### ツイート編集ページ

- https://gyazo.com/100b4a42085fc9738d0bf0ecc69deee2

### ツイート解除機能

- https://gyazo.com/511ee6bb6bc2c027073b3fb9323f402d

### コメント機能

- https://gyazo.com/e0ccac41cac557772241126ebbd89620

### ユーザー詳細ページ

- https://gyazo.com/3b29a9dbe3b217abf6f47ccfd10fe879

## 使用技術

- HTML/CSS
- Ruby
- Ruby on Rails

## 実装予定機能

- カテゴリー検索機能
各種カテゴリーを検索出来ることで自分の知りたい情報をポイントで入手出来ます

- いいね！機能
いいね！機能があることによりコメントに対する評価可視化され、
ツイートに対するそのコメントがベストな回答であったかを客観的に判断出来ると思います。

# DB設計

## users テーブル

| column             | Type  | Options      |
| -------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | string | null: false |
| gender_id          | integer | null: false |

### Association

- has_many :tweets
- has_many :comments

## tweets テーブル

| column　    | Type               | Options    |
| -----------|--------------------|-------------|
| category_id| integer            | null: false |
| text       | text               | null: false |
| user       | references   | foreign_key: true |

### Association

- has_one :comment
- belongs_to :user

## comments テーブル

| column   | Type     | Options             |
| ----------|-----------|--------------------|
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| tweets    | references | foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user
