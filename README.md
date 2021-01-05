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
- has_many :purchases

## itemsテーブル

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| name          | string        | null: false           |
| text          | text          | null: false           |
| category_id   | integer       | null: false           |
| state_id      | integer       | null: false           |
| del_price_id  | integer       | null: false           |
| ship_area_id  | integer       | null: false           |
| ship_day_id   | integer       | null: false           |
| price         | integer       | null: false           |
| user          | references    | foreign_key: true     |

<!-- imageはactive_strage -->

### Association
- belongs_to :user
- has_one :purchase

## purchases

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| user          | references    | foreign_key: true     |
| item          | references    | foreign_key: true     |


### Association
- has_one :ship_info
- belongs_to :user
- belongs_to :item

## ship_infos

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| p_code        | string        | null: false           |
| prefecture_id | integer       | null: false           |
| city          | string        | null: false           |
| address       | string        | null: false           |
| building      | string        |                       |
| phone_num     | string        | null: false           |
| purchase      | references    | foreign_key: true     |

### Association

- belongs_to :purchase
