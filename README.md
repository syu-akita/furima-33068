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

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| nickname      | string        | null: false           |
| email         | string        | null: false           |
| password      | string        | null: false           |
| last_name     | string        | null: false           |
| first_name    | string        | null: false           |
| last_name_k   | string        | null: false           |
| first_name_k  | string        | null: false           |
| year          | string        | null: false           |
| month         | string        | null: false           |
| day           | string        | null: false           |

### Association
- has_many :items


## itemsテーブル

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| name          | string        | null: false           |
| text          | text          | null: false           |
| category      | string        | null: false           |
| state         | string        | null: false           |
| del_fee       | string        | null: false           |
| ship_area     | string        | null: false           |
| ship_day      | string        | null: false           |
| fee           | string        | null: false           |
| user          | refereces     | foreign_keys: true    |

<!-- imageはactive_strage -->

### Association
- belongs_to :user


## items_infos

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| name          | string        | null: false           |
| del_fee       | string        | null: false           |
| fee           | string        | null: false           |
| ship_info     | references    | foreign_keys: true    |

<!-- imageはactive_strage -->

### Association
- has_one :ship_info

## ship_infos

|  Column       |  Type         |  Options              |
| ------------- | ------------- | --------------------- |
| card_num      | string        | null: false           |
| e_month       | string        | null: false           |
| e_year        | string        | null: false           |
| security_code | string        | null: false           |
| p_code        | string        | null: false           |
| prefectures   | string        | null: false           |
| city          | string        | null: false           |
| addres        | string        | null: false           |
| building      | string        | null: false           |
| phone_num     | string        | null: false           |
| item_info     | references    | foreign_keys: true    |

### Association

- belongs_to :item_infos
