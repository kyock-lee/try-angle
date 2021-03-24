require 'rails_helper'

RSpec.describe Meal, type: :model do
  before do
    @meal = FactoryBot.build(:meal)
    @meal.image = fixture_file_upload('app/assets/images/test.jpg')
  end


  describe '食事管理機能' do
    context '食事管理の記録ができるとき' do
      it '画像、日時、説明のデータがあれば記録ができる' do
        expect(@meal).to be_valid
      end

      it '画像、日時のデータがあれば、説明のデータがなくても記録ができる' do
        @meal.description = ''
         expect(@meal).to be_valid
      end
    end

    context '食事管理の記録ができないとき' do
      it '画像が添付されていないと記録できない' do
        @meal.image = nil
        @meal.valid?
        expect(@meal.errors.full_messages).to include("画像を入力してください")
      end

      it '日時を入力しないと記録できない' do
        @meal.date = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("日付を入力してください")
      end
    end
  end


end
