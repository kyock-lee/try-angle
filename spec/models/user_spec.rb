require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password,passwordの確認,family_name,last_name,family_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'パスワードが英数字を含めた６文字以上なら登録できる' do
        @user.password = 'a11111'
        @user.password_confirmation = 'a11111'
        expect(@user).to be_valid
      end

      it 'family_nameが全角で存在すれば登録できる' do
        @user.family_name = '筋肉'
        expect(@user).to be_valid
      end

      it 'last_nameが全角で存在すれば登録できる' do
        @user.family_name = '太朗'
        expect(@user).to be_valid
      end

      it 'family_name_kanaがカタカナの全角で存在すれば登録できる' do
        @user.family_name = 'キンニク'
        expect(@user).to be_valid
      end

      it 'last_name_kanaがカタカナの全角で存在すれば登録できる' do
        @user.family_name = 'タロウ'
        expect(@user).to be_valid
      end
    end


    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが他のユーザーと重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailには「@」が含まれていないと登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'encrypted_passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在しても、password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '11111a'
        @user.password_confirmation = 'a11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは、６文字以上じゃないと登録できない' do
        @user.password = 'a1111'
        @user.password_confirmation = 'a1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは、半角英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは、半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordに全角が含まれると登録できない' do
        @user.password = 'a1111あ'
        @user.password_confirmation = 'a1111あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameが半角だと登録できない' do
        @user.family_name = 'satoh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'kinniku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaが半角だと登録できない' do
        @user.family_name_kana = 'ｷﾝﾆｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'family_name_kanaがカタカナ以外の全角文字だと登録できない' do
        @user.family_name_kana = 'きんにく'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaが半角だと登録できない' do
        @user.last_name_kana = 'ｷﾝﾆｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'Last_name_kanaがカタカナ以外の全角文字だと登録できない' do
        @user.last_name_kana = 'きんにく'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
