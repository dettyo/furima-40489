require 'rails_helper'

RSpec.describe OrderOrderInfo, type: :model do

  before do
    user = FactoryBot.create(:user)
    @order_order_info = FactoryBot.build(:order_order_info, user_id: user.id)
  end

  describe 'オーダー画面' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_order_info).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_order_info.building = ''
        expect(@order_order_info).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_order_info.post_code = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_order_info.post_code = '1234567'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が選択されていないと保存できないこと' do
        @order_order_info.prefecture_id = 1
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_order_info.city = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_order_info.address = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_order_info.telephone_num = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Telephone num can't be blank")
      end
      it '電話番号が半角数値でない保存できないこと' do
        @order_order_info.telephone_num = '０９０１２３４５６７８'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Telephone num is invalid. Input half-width numbers.")
      end
      it '電話番号は9桁以下だと保存できないこと' do
        @order_order_info.telephone_num = '123456789'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Telephone num is invalid. Input half-width numbers.")
      end
      it '電話番号は12桁以上だと保存できないこと' do
        @order_order_info.telephone_num = '123456789012'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Telephone num is invalid. Input half-width numbers.")
      end
      it 'カード入力情報(トークン)が正しくないと保存できないこと' do
        @order_order_info.token = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_order_info.user_id = nil
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("User can't be blank")
      end
      
      it 'itemが紐付いていなければ購入できない' do
        @order_order_info.furima_id = nil
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Furima can't be blank")
      end

    end
  end

end
