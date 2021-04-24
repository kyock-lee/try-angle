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
    # @meals = current_user.meals.includes(:user).order('created_at DESC').limit(9)
    # @training = current_user.trainings.includes(:user).order('created_at DESC').limit(30)
    # @weight = current_user.weights.includes(:user)
  end

  private

  def meal_params
    params.require(:meal).permit(:date,:description,:image).merge(user_id: current_user.id)
  end

end
