class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = params[:user] ? User.new(params[:user]) : User.new_guest
    if @user.save
      session[:user_id] = @user_id
    redirect to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    render text: "hello_workouts!"
  end
end
