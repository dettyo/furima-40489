class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    #binding.pry
    @furima = Furima.new
    @furima = Furima.find(params[:furima_id])
    @order = Order.new
    #binding.pry
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    OrderInfo.create(order_info_params)
    redirect_to root_path
    #binding.pry
  end

  private
  def move_to_index
    furima = Furima.find(params[:furima_id])
    #binding.pry
    if current_user.id == furima.user_id
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:furima).merge(user_id: current_user.id)
  end

  def order_info_params
    params.permit(:post_code, :prefecture_id, :city, :address, :building, :telephone_num).merge(order_id: @order.id)
  end

end
