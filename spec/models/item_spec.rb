require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目が入力されていると登録できるということ' do
    end
    it 'imageが空だと登録できない' do
    end
    it 'nameが空だと登録できない' do
    end
    it 'textが空だと登録できない' do
    end
    it 'category_idが空だと登録できない' do
    end
    it 'state_idが空だと登録できない' do
    end
    it 'dell_priceが空だと登録できない' do
    end
    it 'ship_area_idが空だと登録できない' do
    end
    it 'ship_day_idが空だと登録できない' do
    end
    it 'priceがからだと登録できない' do
    end
    it 'nameが40文字以上だと登録できない' do
    end
    it 'textが1000文字以上だと登録できない' do
    end
    it '価格が300円以下だと登録できない' do
    end
    it '価格が9999999円以上だと登録できない' do
    end
    it '価格が半角数字じゃないと登録できない' do
    end
  end
end
