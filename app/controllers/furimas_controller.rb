class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @furimas = Furima.all.order("created_at DESC")
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

  def show
    @furima = Furima.find(params[:id])
  end

  def edit
    @furima = Furima.find(params[:id])
  end

  def update
    @furima = Furima.find(params[:id])
    if @furima.update(item_params)
      redirect_to furima_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    furima = Furima.find(params[:id])
    furima.destroy
    redirect_to root_path
  end

  private
  def move_to_index
    furima = Furima.find(params[:id])
    unless current_user.id == furima.user_id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:furima).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_fee_info_id, :prefecture_id, :shipping_date_info_id, :price, :image).merge(user_id: current_user.id)
  end

end
