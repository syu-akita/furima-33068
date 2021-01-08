require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '#create' do
    before do
      user1 = FactoryBot.create(:user)
      user1.email = 'test@test'
      user1.save
      item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, user_id: user1.id, item_id: item.id)
      sleep(1)
    end
    context '商品購入ができる時' do
      it '全ての項目が入力されていると登録できる' do
        expect(@item_order).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end 
    end

    context '商品購入ができない時' do
      it 'p_codeが空だと登録できない' do
        @item_order.p_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("P code can't be blank")
      end
      it 'ship_area_idが空だと登録できない' do
        @item_order.ship_area_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Ship area can't be blank")
      end
      it 'cityが空だと登録できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空だと登録できない' do
        @item_order.phone_num = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'p_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @item_order.p_code = '11111111'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('P code is invalid')
      end
      it 'phone_numはハイフンがあると登録できない' do
        @item_order.phone_num = '080-4455-3322'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numは11桁以内出ないと登録できない' do
        @item_order.phone_num = '222222222222'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numは半角英数を含むと登録できない' do
        @item_order.phone_num = 'abc11223300'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone num is invalid')
      end
      it 'ship_area_idが1だと登録できない' do
        @item_order.ship_area_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Ship area must be other than 1')
      end
      it 'tokenが空だと登録できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと登録できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end