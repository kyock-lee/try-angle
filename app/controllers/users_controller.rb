class UsersController < ApplicationController
 
  def index
  end

  def show
    @user = User.find(params[:id])
    @meals = current_user.meals.includes(:user).order('created_at DESC').limit(9)
    @training = current_user.trainings.includes(:user).order('created_at DESC').limit(30)
    @weight = current_user.weights.includes(:user)
  end

end
