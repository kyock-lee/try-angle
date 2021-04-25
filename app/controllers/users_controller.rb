class UsersController < ApplicationController
 
  def index
  end

  def new
    @weight = Weight.new
  end

  def show
    @user = User.find(params[:id])
    @meal = Meal.find(params[:id])
    @weight = Weight.find_by(id: params[:format])
  end

  private

  def meal_params
    params.require(:meal).permit(:date,:description,:image).merge(user_id: current_user.id)
  end

end
