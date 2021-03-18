class TrainingsController < ApplicationController

  def index
    @training = current_user.trainings.includes(:user)
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def search
    @training = Training.search(params[:keyword])
  end

  private

  def training_params
    params.require(:training).permit(:date,:description).merge(user_id: current_user.id)
  end


end
