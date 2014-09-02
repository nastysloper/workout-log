# class ApplicationController < ActionController::Base
#   # This example is taken from rubysteps lesson 12.
#   # what does the before_filter do? before everything?
#   # checks to see if the user is logged in. Okay.
#   #
#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception

#   before_filter :basic_http_authentication

#   def basic_http_authentication
#     authenticate_or_request_with_http_basic do |username, password|
#       self.current_user = User.find_by_username_and_password(username, password)
#     end
#   end

#   def current_user=(user)
#     @current_user = user
#   end

#   def current_user
#     @current_user
#   end
#   helper_method :current_user
# end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def authorize
      redirect_to login_url, alert: "Not authorized!" if current_user.nil?
    end
end
