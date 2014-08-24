class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(params[:user])
    session[:user_id] = @user_id
    redirect_to root_url, notice: "Thank you for signing up!"
  end

  def show
    @user = User.find(params[:id])
    render text: "hello_workouts!"
  end
end
