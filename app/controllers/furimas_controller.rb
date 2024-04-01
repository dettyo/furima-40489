class FurimasController < ApplicationController

  def index
    #binding.pry
    #@furimas = Furima.new
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.create(furima_params)
  end

  private
  #def move_to_index
  #  prototype = Prototype.find(params[:id])
  #  #unless user_signed_in?
  #  unless current_user.id == prototype.user_id
  #    redirect_to action: :index
  #  end
  #end

  def furima_params
    params.require(:furima).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end


end
