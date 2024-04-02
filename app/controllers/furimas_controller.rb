class FurimasController < ApplicationController

  def index
    #binding.pry
    #@furimas = Furima.new
  end

  def new
    @furima = Furima.new
    #@item = Item.new
    #binding.pry
  end

  def create
    @furima = Furima.create(item_params)
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  #def move_to_index
  #  prototype = Prototype.find(params[:id])
  #  #unless user_signed_in?
  #  unless current_user.id == prototype.user_id
  #    redirect_to action: :index
  #  end
  #end

  def item_params
    params.require(:furima).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_fee_info_id, :prefecture_id, :shipping_date_info_id, :price, :image).merge(user_id: current_user.id)
  end

   

end
