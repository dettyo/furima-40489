class CreateOrderInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :order_infos do |t|
      t.string        :post_code,     null: false
      t.integer       :prefecture_id, null: false
      t.string        :city,          null: false
      t.string        :address,       null: false
      t.string        :building,      null: true
      t.string        :telephone_num, null: false
      t.references    :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
