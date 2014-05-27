class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.date :date
      t.text :text

      t.timestamps
    end
  end
end
