require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '全ての項目が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'ニックネームが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'すでに存在するメールアドレスは保存できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスに@が含まれていないと保存できないこと' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満だと保存できないこと' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが半角英字のみでは保存できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
      end

      it 'パスワードが半角英字のみでは保存できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
      end

      it 'パスワードが全角文字含む場合は保存できないこと' do
        @user.password = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
      end

      it 'パスワードとパスワード（確認）が一致していないと保存できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe 'バリデーション' do
    it '名字（全角）が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前（全角）が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'Smith'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください")
    end
  
    it '名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'John'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください")
    end

    it '名字（カナ）が必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '名前（かな）が必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '名字（カナ）が全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'Smith'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力してください")
    end

    it '名前（カナ）が全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'Jhon'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください")
    end

    it '生年月日が必須であること' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
