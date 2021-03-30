class WeightsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :search]

  def index
    @weight = current_user.weights.includes(:user)
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def update
    weight = Weight.find(params[:id])
    if weight.update(weight_params)
      redirect_to action: 'index'
    else
      render :edit
    end    
  end

  private
  def weight_params
    params.require(:weight).permit(:weight, :date).merge(user_id: current_user.id)
  end


end
