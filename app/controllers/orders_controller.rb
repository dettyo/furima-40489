class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @furima = Furima.new
    @furima = Furima.find(params[:furima_id])
    @order_order_info = OrderOrderInfo.new
  end

  def create
    @order_order_info = OrderOrderInfo.new(order_params)
    if @order_order_info.valid?
      @order_order_info.save
      redirect_to root_path
    else
      @furima = Furima.new
      @furima = Furima.find(params[:furima_id])
      render :index, status: :unprocessable_entity
    end
  end

  private
    def move_to_index
      furima = Furima.find(params[:furima_id])
      if current_user.id == furima.user_id || furima.order.present?
        redirect_to root_path
      end
    end

    def order_params
      params.require(:order_order_info).permit(:post_code, :prefecture_id, :city, :address, :building, :telephone_num).merge(furima_id: params[:furima_id], user_id: current_user.id)
    end
end
