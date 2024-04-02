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
    end
  end
end
