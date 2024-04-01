class FurimasController < ApplicationController

  def index
    #binding.pry
    #@furimas = Furima.new
  end

  def new
    @furima = furima.new
    @item = Item.new
    #binding.pry
  end

  def create
    @furima = Item.create(item_params)
  end

  private
  #def move_to_index
  #  prototype = Prototype.find(params[:id])
  #  #unless user_signed_in?
  #  unless current_user.id == prototype.user_id
  #    redirect_to action: :index
  #  end
  #end

  def item_paramsparams
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id,  :prefecture_id, :price)
    #params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_fee_info_id, :prefecture_id, :shipping_date_info_id, :price)
    #params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_fee_info_id, :prefecture_id, :shipping_date_info_id, :price).merge(user_id: current_user.id)
  end

   

end
