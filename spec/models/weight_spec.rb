require 'rails_helper'

RSpec.describe Weight, type: :model do
  before do
   @weight = FactoryBot.build(:weight)
  end


  describe '体重管理機能' do
    context '体重管理の記録ができるとき' do
      it '体重、日時のデータがあれば記録ができる' do
        expect(@weight).to be_valid
      end
    end

    context '体重管理の記録ができないとき' do
      it '体重を入力しないと記録できない' do
        @weight.weight = ''
        @weight.valid?
        expect(@weight.errors.full_messages).to include("体重を入力してください")
      end

      it '日付を入力しないと記録できない' do
        @weight.date = ''
        @weight.valid?
        expect(@weight.errors.full_messages).to include("日付を入力してください")
      end

      it '体重は、マイナスの値は記録できない' do
        @weight.weight = -10
        @weight.valid?
        expect(@weight.errors.full_messages).to include("体重は0以上の値にしてください")
      end

      it '体重は、数値は以外は記録できない' do
        @weight.weight = '五十'
        @weight.valid?
        expect(@weight.errors.full_messages).to include("体重は数値で入力してください")
      end

    end
  end


end
