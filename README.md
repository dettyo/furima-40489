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
- has_many :items
- has_many :orders


## itemsテーブル

| Column                 | Type       | Options                        |
| -------------------    | ---------- | ------------------------------ |
| item_name              | string     | null: false                    |
| explanation            | text       | null: false                    |
| category               | references | null: false, ActiveHash        |
| condition              | references | null: false, ActiveHash        |
| shipping_fee_info      | references | null: false, ActiveHash        |
| prefecture             | references | null: false, ActiveHash        |
| shipping_date_info     | references | null: false, ActiveHash        |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- has_one :order
- has_one_attached :image
- belongs_to :user
- belongs_to :category_id
- belongs_to :condition_id
- belongs_to :shipping_fee_info_id
- belongs_to :prefecture_id
- belongs_to :shipping_date_info_id

## ordersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- has_one :order_info
- belongs_to :user
- belongs_to :item


## order_infosテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefecture          | references | null: false, ActiveHash        |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building            | string     | null: true                     |
| telephone_num       | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :prefecture_id


## categoriesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :items


## conditionsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :items


## shipping_fee_infosテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :items


## prefecturesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :items
- has_many :order_infos


## shipping_date_infosテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### Association
- has_many :items
