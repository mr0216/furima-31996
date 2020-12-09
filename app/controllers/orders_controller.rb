class OrdersController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
