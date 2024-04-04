class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  #before_action :move_to_index, only: [:index]

  def index
    #binding.pry
    @furima = Furima.new
    @furima = Furima.find(params[:furima_id])
    #@order = Order.new
    @order_order_info = OrderOrderInfo.new
    #binding.pry
  end

  #def new
  #  @order_order_info = OrderOrderInfo.new
  #end

  def create
    @order_order_info = OrderOrderInfo.new(order_params)
    #binding.pry
    if @order_order_info.valid?
      @order_order_info.save
      redirect_to root_path
    else
      @furima = Furima.new
      @furima = Furima.find(params[:furima_id])
      render :index, status: :unprocessable_entity
    end

    #@order = Order.create(order_params)
    #OrderInfo.create(order_info_params)
    #redirect_to root_path

  end

  private
    def move_to_index
      furima = Furima.find(params[:furima_id])
      if current_user.id == furima.user_id
        redirect_to root_path
      end
    end

    def order_params
      #binding.pry
      params.require(:order_order_info).permit(:post_code, :prefecture_id, :city, :address, :building, :telephone_num).merge(furima_id: params[:furima_id], user_id: current_user.id)
      #  params.permit(:furima).merge(user_id: current_user.id)
    end

  #def order_info_params
  #  binding.pry
  #  params.permit(:post_code, :prefecture_id, :city, :address, :building, :telephone_num).merge(order_id: @order.id)
  #end

end
