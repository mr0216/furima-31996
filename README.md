# テーブル設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
| nickname   | string | null: false |
| email      | string | null: false |
| encrypted_password | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| last_name(カタカナ) | string | null: false |
| first_name(カタカナ) | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one :address
- has_many :comments


## itemsテーブル

|Column                   |Type |Options|
|------                   |---- |-------|
| name                    | string  | null: false |
| introduction            | text    | null: false |
| price                   | integer | null: false |
| category                | integer | null: false |
| condition               | integer | null: false |
| postage                 | integer | null: false |
| shipping_area           | integer | null: false |
| estimated_shipping_date | integer | null: false |


### Association
- belongs_to :user
- belongs_to :address
- has_one :purchase
- has_many :comments



## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
| user  | references | null: false, foreign_key: true |
| items | references | null: false, foreign_key: true |
| date  | string     | null: false |


### Association
- belongs_to :user



## addressテーブル

|Column|Type|Options|
|------|----|-------|
| purchase    | reference | null: false |
| postal_code | integer   | null: false |
| prefecture  | string    | null: false |
| city        | string    | null: false |
| address     | string    | null: false |
| building    | string    |


### Association
- belongs_to :purchase


## comments テーブル

| Column     | Type       | Options     |
| ------     | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |
| item       | references | 

### Association

- belongs_to :user
- belongs_to :item