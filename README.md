# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル 

|  Column             |  Type         |  Options              |
| ------------------- | ------------- | --------------------- |
| nickname            | string        | null: false           |
| email               | string        | null: false           |
| encrypted_password  | string        | null: false           | 
| last_name           | string        | null: false           |
| first_name          | string        | null: false           |
| last_name_k         | string        | null: false           |
| first_name_k        | string        | null: false           |
| birthday            | date          | null: false           |

### Association
- has_many :items
- has_many :items_infos

## itemsテーブル

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| name          | string        | null: false           |
| text          | text          | null: false           |
| category_id   | integer       | null: false           |
| state_id      | integer       | null: false           |
| del_fee_id    | integer       | null: false           |
| ship_area_id  | integer       | null: false           |
| ship_day_id   | integer       | null: false           |
| price         | integer       | null: false           |
| user          | refereces     | foreign_keys: true    |

<!-- imageはactive_strage -->

### Association
- belongs_to :user
- has_many :items_info

## items_infos

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| user          | references    | foreign_keys: true    |
| item          | references    | foreign_keys: true    |
| ship_info     | references    | foreign_keys: true    |


### Association
- has_one :ship_info
- belongs_to :user
- belongs_to :item

## ship_infos

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| p_code        | string        | null: false           |
| prefectures_id| integer       | null: false           |
| city          | string        | null: false           |
| addres        | string        | null: false           |
| building      | string        | null: false           |
| phone_num     | string        | null: false           |
| item_info     | references    | foreign_keys: true    |

### Association

- belongs_to :item_info
