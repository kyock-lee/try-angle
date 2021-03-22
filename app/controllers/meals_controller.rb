class MealsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :search, :edit, :update]

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

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    meal = Meal.find(params[:id])
    if meal.update(meal_params)
      redirect_to action: 'index'
    else
      render :edit
    end    
  end

  private

  def meal_params
    params.require(:meal).permit(:date,:description,:image).merge(user_id: current_user.id)
  end

end
