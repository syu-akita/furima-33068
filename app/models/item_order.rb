class ItemOrder
  include ActiveModel::Model
  attr_accessor :p_code, :city, :address, :building, :phone_num, :ship_area_id, :token, :user_id, :item_id

  with_options presence: true do
    validates :p_code
    validates :city
    validates :address
    validates :phone_num
    validates :ship_area_id
    validates :token
  end

  validates :p_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :ship_area_id, numericality: { other_than: 1 }
  validates :phone_num, format: { with: /\A\d{10,11}\z/ }
  validates :token, format: { with: /\A[a-z0-9]+\z/ }

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    ShipInfo.create!(p_code: p_code, city: city, address: address, building: building, phone_num: phone_num,
                     ship_area_id: ship_area_id, order_id: order.id)
  end
end
