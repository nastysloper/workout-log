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

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
