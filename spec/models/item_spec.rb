require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目が入力されていると登録できるということ' do
      expect(@item).to be_valid
    end
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空だと登録できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'category_idが空だと登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it 'state_idが空だと登録できない' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State is not a number")
    end
    it 'dell_price_idが空だと登録できない' do
      @item.dell_price_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Dell price is not a number")
    end
    it 'ship_area_idが空だと登録できない' do
      @item.ship_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship area is not a number")
    end
    it 'ship_day_idが空だと登録できない' do
      @item.ship_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day is not a number")
    end
    it 'priceがからだと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'nameが40文字以上だと登録できない' do
      @item.name = "a" * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end
    it 'textが1000文字以上だと登録できない' do
      @item.text = "あ" * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
    end
    it '価格が300円以下だと登録できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格が9999999円以上だと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '価格が半角数字じゃないと登録できない' do
      @item.price = "９９９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
