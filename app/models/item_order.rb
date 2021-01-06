class ItemOrder
  include ActiveModel::Model
  attr_accessor :p_code, :city, :address, :building, :phone_num, :ship_area

  with_options presence: true do
    validates :p_code
    validates :city
    validates :address
    validates :phone_num
    validates :ship_area
  end

  validates :p_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :ship_area, numericality: {other_than: 1}
end