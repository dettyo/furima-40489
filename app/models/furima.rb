class Furima < ApplicationRecord

    #ここにorderのアソシエーションを追加する。下記のActiveHashとは別
  
  has_one_attached :image
  belongs_to :user
  
  #ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_fee_info
    belongs_to :prefecture
    belongs_to :shipping_date_info
  
    #空の投稿を保存できないようにする
    validates :item_name,  presence: true
    validates :explanation, presence: true
    validates :category_id, presence: true
    validates :condition_id, presence: true
    validates :shipping_fee_info_id, presence: true
    validates :prefecture_id, presence: true
    validates :shipping_date_info_id, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :user, presence: true
    validates :image, presence: true
  
    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_fee_info_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_date_info_id, numericality: { other_than: 1 , message: "can't be blank"}
  
end
