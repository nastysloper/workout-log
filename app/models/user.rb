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
  validates :name, presence: true
  validates :email, presence: true
  has_many :workouts, dependent: :destroy

  def create(name, email)
    @user = User.new(name, email)
  end

  private
    def self.authenticate_safely(user_name, user_email)
      where(name: user_name, email: user_email).first
    end
end
