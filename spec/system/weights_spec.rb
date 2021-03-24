require 'rails_helper'

RSpec.describe "Weights", type: :system do
  before do
    #ログイン状態にする
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @weight = FactoryBot.create(:weight)
    sleep(0.1)
  end

  context '体重が記録ができるとき' do 
    it '正しい情報を入力すれば体重の記録ができて体重管理のトップページに移動する' do
      # トップページに移動する
      visit weights_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 新規登録ページへ移動する
      visit new_weight_path
      # 体重の情報を入力する
      find("#weight_date_1i").find("option[value='2021']").select_option
      find("#weight_date_2i").find("option[value='1']").select_option
      find("#weight_date_3i").find("option[value='1']").select_option
      fill_in 'weight_weight', with: 50
      # 送信ボタンを押すとWeightモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Weight.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(weights_path)
    end
  end

  context '体重が記録ができない' do 
    it '誤った情報を入力では体重の記録ができず、記録入力ページに留まる' do
      # トップページに移動する
      visit weights_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 新規登録ページへ移動する
      visit new_weight_path
      # 体重の情報を入力する
      find("#weight_date_1i").find("option[value='']").select_option
      find("#weight_date_2i").find("option[value='']").select_option
      find("#weight_date_3i").find("option[value='']").select_option
      fill_in 'weight_weight', with: ''
      # 送信ボタンを押すとWeightモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Weight.count }.by(0)
      # 記録入力ページに留まることを確認する
      expect(current_path).to eq(weights_path)
    end
  end
  

end
