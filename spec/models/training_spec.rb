require 'rails_helper'

RSpec.describe Training, type: :model do
  before do
    @training = FactoryBot.build(:training)
  end

  describe 'トレーニング管理機能' do
    context 'トレーニング管理の記録ができるとき' do
      it '日時、説明のデータがあれば記録ができる' do
        expect(@training).to be_valid
      end
    end

    context 'トレーニングの記録ができないとき' do
      it '日時がなければ記録ができない' do
        @training.date = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("日付を入力してください")
      end

      it 'トレーニングの説明がなければ記録ができない' do
        @training.description = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("トレーニング内容を入力してください")
      end
    end
  end
end
