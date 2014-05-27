class WorkoutsController < ApplicationController
  def index
  end

  def create
    render plain: params[:workout].inspect
    @workout = Workout.new(params[:workout])
    @workout.save
    redirect_to @workout
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
