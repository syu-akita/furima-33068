class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit
  before_action :move_to_toppage, only: [:edit, :destroy]
  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :state_id,
                                 :dell_price_id, :ship_area_id, :ship_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user == @item.user
  end

  def move_to_toppage
    redirect_to action: :index if @item.order != nil
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
