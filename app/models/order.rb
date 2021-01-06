class Order < ApplicationRecord
  belongs_to        :item
  belongs_to        :user
  belongs_to        :ship_area
  has_one           :ship_info
end
