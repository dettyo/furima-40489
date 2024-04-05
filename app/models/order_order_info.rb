class OrderOrderInfo

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :telephone_num, :furima_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address
    validates :telephone_num, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width numbers." }
  end

  def save
    order = Order.create(user_id: user_id, furima_id: furima_id)
    OrderInfo.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone_num: telephone_num, order_id: order.id)
  end
end