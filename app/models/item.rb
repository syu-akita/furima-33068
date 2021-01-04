class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :dell_price
  belongs_to :ship_area
  belongs_to :ship_day
end
