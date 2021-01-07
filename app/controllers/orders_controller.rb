class OrdersController < ApplicationController
  def index
    @item_order = ItemOrder.new
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      Payjp.api_key = ENV["PAYJP_SECLET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.require(:item_order).permit(:p_code, :city, :address, :phone_num, :ship_area_id, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end