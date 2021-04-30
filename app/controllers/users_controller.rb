class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :show, :edit, :update]
 
  def index
  end

  def new
    @weight = Weight.new
    @meal = Meal.new
    @training = Training.new
  end

  def show
    @meal = Meal.where(date: params[:id]).order('created_at DESC')
    @weight = Weight.where(date: params[:id]).order('created_at DESC')
    @training = Training.where(date: params[:id]).order('created_at DESC')
  
  end

  private

  def meal_params
    params.require(:meal).permit(:date,:description,:image).merge(user_id: current_user.id)
  end

end
