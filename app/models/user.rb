# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :workouts, dependent: :destroy

  #validates_presence_of :name, :email
  #validates_uniqueness_of :email

  # the following option is only available in Rails 4:
  has_secure_password(validations: false)

  def create
    @user = User.create(user_params)
  end

  # def self.new_guest
  #   new {|u| u.guest = true}
  # end

  private
    def user_params
      params.require(:name, :email, :password).permit(:name, :email, :password)
    end

    # def self.authenticate_safely(user_name, user_email)
    #   where(name: user_name, email: user_email).first
    # end
end
