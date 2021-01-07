FactoryBot.define do
  factory :item_order do
    p_code                { '350-0027' }
    city                  { '狭山市' }
    address               { 'さやま町 1-3-4' }
    phone_num             { '08033994455' }
    building              { 'アパホテル' }
    ship_area_id          { 20 }
  end
end