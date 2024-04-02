class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index] #:show

  def index
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(item_params)
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:furima).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_fee_info_id, :prefecture_id, :shipping_date_info_id, :price, :image).merge(user_id: current_user.id)
  end

end
