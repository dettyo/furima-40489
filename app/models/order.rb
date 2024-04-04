class Order < ApplicationRecord
  has_one :order_info
  belongs_to :user
  belongs_to :furima

end
