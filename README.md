## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique:true       |
| encrypted_password  | string     | null: false                    |
| birth_date          | date       | null: false                    |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| first_name_kana     | string     | null: false                    |

### Association
- has_many :furimas
- has_many :orders


## Furimaテーブル

| Column                 | Type       | Options                        |
| -------------------    | ---------- | ------------------------------ |
| item_name              | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false, ActiveHash        |
| condition_id           | integer    | null: false, ActiveHash        |
| shipping_fee_info_id   | integer    | null: false, ActiveHash        |
| prefecture_id          | integer    | null: false, ActiveHash        |
| shipping_date_info_id  | integer    | null: false, ActiveHash        |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- has_one :order
- has_one_attached :image
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_fee_info
- belongs_to :prefecture
- belongs_to :shipping_date_info

## ordersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| furima              | references | null: false, foreign_key: true |

### Association
- has_one :order_info
- belongs_to :user
- belongs_to :furima


## order_infosテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefecture_id       | integer    | null: false, ActiveHash        |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building            | string     | null: true                     |
| telephone_num       | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :prefecture


## categoriesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :furimas


## conditionsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :furimas


## shipping_fee_infosテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :furimas


## prefecturesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :furimas
- has_many :order_infos


## shipping_date_infosテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :furimas
