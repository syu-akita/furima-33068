class DellPrice < ActiveHash::Base
  self.date = [
    {id: 1, price: '---'},
    {id: 2, price: '着払い(購入者負担)'},
    {id: 3, price: '送料込み(出品者負担)'}
  ]
end
