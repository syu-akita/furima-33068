FactoryBot.define do
  factory :item do
    name                  { 'test' }
    text                  { 'testtest' }
    category_id           {2}
    state_id              {2}
    dell_price_id         {2}
    ship_area_id          {2}
    ship_day_id           {2}
    price                 {3000}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
