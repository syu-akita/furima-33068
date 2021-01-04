class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :dell_price
  belongs_to :ship_area
  belongs_to :ship_day
  belongs_to :user
  has_one_attached :image

  validates :name, :text, :price,:image, presence: true
  validates :name, length: {maximum: 40 }
  validates :text, length: {maximum: 1000 }
  validates :price, numericality: {:greater_than_or_equal_to => 300}
  validates :price, numericality: {:less_than_or_equal_to => 9999999}
  validates :price, numericality: {only_integer: true }
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :dell_price_id
    validates :ship_area_id
    validates :ship_day_id
  end
end
