class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @items = Item.all
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end


  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.reqire(:item).permit(:image, :name, :intruduction, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end
