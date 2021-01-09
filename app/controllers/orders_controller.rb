class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :move_to_index, only: :index
  def index
    @item_order = ItemOrder.new
    redirect_to root_path unless @item.order.nil? 
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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
    params.require(:item_order).permit(:p_code, :city, :address, :phone_num, :ship_area_id, :building).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end
end
