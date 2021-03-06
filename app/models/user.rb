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

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  # the following option on validations is only available in Rails 4:
  # it's used for guest_user access
  has_secure_password(validations: false)
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
      # self.remember_token = SecureRandom.urlsafe_base64
    end
end
