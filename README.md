# テーブル設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kane    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :comments


## itemsテーブル

|Column |Type |Options|
|------ |---- |-------|
| name                       | string     | null: false |
| introduction               | text       | null: false |
| price                      | integer    | null: false |
| category_id                | integer    | null: false |
| condition_id               | integer    | null: false |
| postage_id                 | integer    | null: false |
| prefecture_id              | integer    | null: false |
| estimated_shipping_date_id | integer    | null: false |
| user                       | references | null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one :purchase
- has_many :comments



## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル

|Column|Type|Options|
|------|----|-------|
| purchase      | reference | null: false, foreign_key: true |
| postal_code   | string    | null: false |
| prefecture_id | integer   | null: false |
| city          | string    | null: false |
| address       | string    | null: false |
| building      | string    |
| phone_number  | string    | null: false |


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