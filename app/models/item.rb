class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :dell_price
  belongs_to :ship_area
  belongs_to :ship_day
  belongs_to :user

  validates :name, :text, :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :dell_price_id
    validates :ship_area_id
    validates :ship_day_id
  end
end
