# README

# データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|user_image|string||
|profile_description|text||
|password|string|null: false|

### Association
- has_many :cafes
- has_many :reviews

## shopsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|access|string||
|address|string||
|business_hours|string||
|holiday|string||
|seat|string||
|smoking|string||
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :cafe_images

## shop_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|cafe|references|foreign_key: true|

### Association
- belongs_to :cafe

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|user|references|foreign_key: true|
|cafe|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :cafe

## tagsテーブル

### Association

## likesテーブル

### Association