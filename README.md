# README

ツイッターのデザインを元にしたsnsアプリを作成しました。

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|limit: 140, null: false|
|image|string|
|created_at|datetime|null: false|
|updated_at|integer|null: false|
|user_id|integer|null: false|

### Association
belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|nickname|string|null: false|
|username|string|null: false|
|image|string|

### Association
has_many :tweets
