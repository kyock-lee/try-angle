require 'rails_helper'

RSpec.describe "Meals", type: :system do
  before do
    #ログイン状態にする
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @meal = FactoryBot.build(:meal)
    @meal.image = fixture_file_upload('app/assets/images/test.jpg')
    @meal.save
    sleep(0.1)
  end

  context '食事の記録ができるとき' do 
    it '正しい情報を入力すれば食事の記録ができて食事管理のトップページに移動する' do
      # トップページに移動する
      visit meals_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 新規登録ページへ移動する
      visit new_meal_path
      # 食事の情報を入力する
      image_path = Rails.root.join('app/assets/images/test.jpg')
      attach_file('meal[image]', image_path, make_visible: true)
      find("#meal_date_1i").find("option[value='2021']").select_option
      find("#meal_date_2i").find("option[value='1']").select_option
      find("#meal_date_3i").find("option[value='1']").select_option
      fill_in 'meals-info', with: @meal.description
      # 送信ボタンを押すとMealモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Meal.count }.by(1)
      # トップページに投稿した内容があるかを確認する
      expect(page).to have_selector("img[src$='test.jpg']")
      expect(page).to have_content("2021")
      expect(page).to have_content("1")
      expect(page).to have_content("1")
      expect(page).to have_content("食事内容の説明です")
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(meals_path)
    end
  end

  context '食事の記録ができないとき' do 
    it '誤った情報を入力では食事の記録ができず、記録入力ページに留まる' do
      # トップページに移動する
      visit meals_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 新規登録ページへ移動する
      visit new_meal_path
      # 食事の情報を入力する
      find("#meal_date_1i").find("option[value='']").select_option
      find("#meal_date_2i").find("option[value='']").select_option
      find("#meal_date_3i").find("option[value='']").select_option
      fill_in 'meals-info', with: ''
      # 送信ボタンを押すとMealモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Meal.count }.by(0)
      # 記録入力ページに留まることを確認する
      expect(current_path).to eq(meals_path)
    end
  end
end
