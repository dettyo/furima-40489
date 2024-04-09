class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_furima, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  before_action :set_public_key, only: [:index, :create]

  def index
    @order_order_info = OrderOrderInfo.new
  end

  def create
    @order_order_info = OrderOrderInfo.new(order_params)
    if @order_order_info.valid?
      pay_item
      @order_order_info.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def move_to_index
    if current_user.id == @furima.user_id || @furima.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_order_info).permit(:post_code, :prefecture_id, :city, :address, :building, :telephone_num).merge(furima_id: params[:furima_id], user_id: current_user.id, token: params[:token])
  end

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def set_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def pay_item
    price = @furima.price
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
