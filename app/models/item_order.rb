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
  validates :phone_num, format: {with: /\A\d{10,11}\z/}

  def save
    item = Item.create(name: name, text: text, price: price, category_id: category_id, state_id: state_id, dell_price_id: dell_price_id, ship_area_id: ship_area, ship_day_id: ship_day_id)
    ShipInfo.create(p_code: p_code, city: city, address: address, phone_num: phone_num, ship_area: ship_area, item_id: item.id)
  end
end