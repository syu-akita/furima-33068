class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :state_id, 
      :dell_price_id, :ship_area_id, :ship_day_id).merge(user_id: current_user.id)
  end
end
