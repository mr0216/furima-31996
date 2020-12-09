class OrdersController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render 'orders/index'
    end
  end

  private
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number,:item_id).merge(user_id: current_user.id)
  end

end
