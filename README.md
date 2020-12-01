# テーブル設計

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

| column　   | Type     | Options             |
| ----------|-----------|--------------------|
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| tweets    | references | foreign_key: true |　　　

### Association

- belongs_to :tweet
- belongs_to :user
