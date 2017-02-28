class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :description
      t.string :name
      t.timestamps
    end
  end
end
