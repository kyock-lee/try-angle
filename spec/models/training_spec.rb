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
        expect(@training.errors.full_messages).to include("Date can't be blank")
      end

      it 'トレーニングの説明がなければ記録ができない' do
        @training.description = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("Description can't be blank")
      end


    end
  end


end
