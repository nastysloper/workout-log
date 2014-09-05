class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Email or password is invalid"
      render 'new'
    end
  end

  def destroy
    sign_out
    puts "Authorization: #{request.authorization}"
    redirect_to root_path notice: "Logged out!"
  end
end
