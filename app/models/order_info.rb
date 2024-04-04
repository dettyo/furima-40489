class OrderInfo < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture

  #validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
  #validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  #validates :city, presence: true
  #validates :address, presence: true
  #validates :telephone_num, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width numbers." }

  end
