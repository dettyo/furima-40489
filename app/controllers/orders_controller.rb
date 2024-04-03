class OrdersController < ApplicationController

  def index
    #binding.pry
    @furima = Furima.new
    @furima = Furima.find(params[:furima_id])
    @order = Order.new
    #binding.pry
  end

end
