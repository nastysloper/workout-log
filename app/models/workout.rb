# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  date       :date
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#

class Workout < ActiveRecord::Base
  belongs_to :user
end
