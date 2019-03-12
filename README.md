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
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy

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
|profile|text|
|email|index|
|reset_password_token|index|unique: true|
### Association
has_many :tweets, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
has_many :followings, through: :active_relationships, source: :follower
has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
has_many :followers, through: :passive_relationships, source: :following

## relationshipsテーブル
|following_id|integer||
|follower_id|integer||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
### Association
belongs_to :following, class_name: "User"
belongs_to :follower, class_name: "User"

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false|
|user_id|integer|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|tweet_id|index|null: false|
|user_id|index|null: false|
### Association
validates :user_id, presence: true
validates :tweet_id, presence: true

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|limit: 140, null: false|
|tweet_id|integer|null: false|
|user_id|integer|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
### Association
belongs_to :user
belongs_to :tweet
