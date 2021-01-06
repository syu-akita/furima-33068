class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.require(:item_order).permit(:p_code, :city, :address, :phone_num, :ship_area)
  end
end
