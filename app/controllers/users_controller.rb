class UsersController < ApplicationController
  def show
    # this method is called when you create a new user.
    @user = User.find(params[:id])
    render text: "hello_workouts!"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
    end
    # WHere is the session id set?
    # in the sessions controller, in def create of course!
    # session[:user_id] = @user_id
    # redirect_to root_url, notice: "Thank you for signing up!"
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
