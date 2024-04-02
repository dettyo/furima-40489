require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '全ての項目が正しく入力されていれば保存できること' do
        expect(@furima).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it '商品名が空だと保存できないこと' do
        @furima.item_name = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が空だと保存できないこと' do
        @furima.explanation = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが---だと保存できないこと' do
        @furima.category_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Category can't be blank")
      end

      it '状態が---だと保存できないこと' do
        @furima.condition_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Condition can't be blank")
      end
      
      it '発送費情報が---だと保存できないこと' do
        @furima.shipping_fee_info_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Shipping fee info can't be blank")
      end
      
      it '都道府県が---だと保存できないこと' do
        @furima.prefecture_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it '発送日時情報が---だと保存できないこと' do
        @furima.shipping_date_info_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Shipping date info can't be blank")
      end
      
      it '価格が空だと保存できないこと' do
        @furima.price = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank")
      end
      
      it '画像が空だと保存できないこと' do
        @furima.image = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
      end

      it '価格は300円以下だと保存できないこと' do
        @furima.price = 299
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格は10000000円以上だと保存できないこと' do
        @furima.price = 10000000
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格は半角数値のみ保存可能であること' do
        @furima.price = '１０００'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐づいていないと出品できない' do
        @furima.user = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("User must exist")
      end

    end
  end
end
