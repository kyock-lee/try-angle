require 'rails_helper'

RSpec.describe "Trainings", type: :system do
  before do
    #ログイン状態にする
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @training = FactoryBot.create(:training)
    sleep(0.1)
  end

  context 'トレーニングが記録ができるとき' do 
    it '正しい情報を入力すればトレーニングの記録ができてトレーニング管理のトップページに移動する' do
      # トップページに移動する
      visit trainings_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 新規登録ページへ移動する
      visit new_training_path
      # トレーニングの情報を入力する
      find("#training_date_1i").find("option[value='2021']").select_option
      find("#training_date_2i").find("option[value='1']").select_option
      find("#training_date_3i").find("option[value='1']").select_option
      fill_in 'training-info', with: @training.description
      # 送信ボタンを押すとTrainingモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Training.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(trainings_path)
    end
  end

  context 'トレーニングが記録ができない' do 
    it '誤った情報を入力ではトレーニングの記録ができず、記録入力ページに留まる' do
      # トップページに移動する
      visit trainings_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 新規登録ページへ移動する
      visit new_training_path
      # 体重の情報を入力する
      find("#training_date_1i").find("option[value='']").select_option
      find("#training_date_2i").find("option[value='']").select_option
      find("#training_date_3i").find("option[value='']").select_option
      fill_in 'training-info', with: ''
      # 送信ボタンを押すとTrainingモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Training.count }.by(0)
      # 記録入力ページに留まることを確認する
      expect(current_path).to eq(trainings_path)
    end
  end
end
