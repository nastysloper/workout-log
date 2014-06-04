class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def create
    # render plain: params[:workout].inspect
    # throws an error when used with a redirect
    @workout = Workout.new(workout_params)

    @workout.save
    redirect_to @workout
  end

  def new
  end

  def edit
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def workout_params
      params.require(:workout).permit(:text)
    end
end
