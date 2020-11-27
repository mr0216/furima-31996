# テーブル設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| last_name      | string  | null: false |
| first_name     | string  | null: false |
| birthday_year  | integer | null: false |
| birthday_month | integer | null: false |
| birthday_day   | integer | null: false |


### Association

- has_many :items
- has_many :purchases
- has_one :address
- has_many :comments


## itemsテーブル

|Column                   |Type |Options|
|------                   |---- |-------|
| name                    | string       | null: false |
| introduction            | text         | null: false |
| price                   | integer      | null: false |
| image                   | ActiveStorage|
| category                | references   | null: false |
| condition               | references   | null: false |
| postage                 | references   | null: false |
| shipping_area           | references   | null: false |
| estimated_shipping_date | references   | null: false |
| seller_id               | references   | null: false |
| buyer_id                | references   | null: false |


### Association
- belongs_to :user
- belongs_to :address
- has_one :purchase
- has_many :comments



## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
| user      | references | null: false |
| item       | references | null: false |
| purchase_date | references | null: false |


### Association
c
- belongs_to :item



## addressテーブル

|Column|Type|Options|
|------|----|-------|
| user_id     | reference | null: false |
| postal_code | integer   | null: false |
| prefecture  | string    | null: false |
| city        | string    | null: false |
| address     | string    | null: false |
| building    | string    | null: false |


### Association
- belongs_to :user


## comments テーブル

| Column     | Type       | Options     |
| ------     | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |
| item       | references | 

### Association

- belongs_to :user
- belongs_to :item