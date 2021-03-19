class MealsController < ApplicationController

  def index
    @meals = current_user.meals.includes(:user).order('created_at DESC')
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def search
    @meals = Meal.search(params[:keyword])
  end

  private

  def meal_params
    params.require(:meal).permit(:date,:description,:image).merge(user_id: current_user.id)
  end

end
