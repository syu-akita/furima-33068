require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '#create' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    it '全ての項目が入力されていると登録できる' do
      expect(@item_order).to be_valid
    end
    it 'p_codeが空だと登録できない' do
    end
    it 'ship_area_idが空だと登録できない' do
    end
    it 'cityが空だと登録できない' do
    end
    it 'addressが空だと登録できない' do
    end
    it 'phone_numが空だと登録できない' do
    end
    it 'p_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
    end
    it 'phone_numはハイフンがあると登録できない' do
    end
    it 'phone_numは11桁以内出ないと登録できない' do
    end
    it 'phone_numは半角英数を含むと登録できない' do
    end
    it 'ship_area_idが1だと登録できない' do
    end
    it 'buildingは空でも登録できる' do
    end
  end
end