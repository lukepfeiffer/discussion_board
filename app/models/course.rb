class Course < ActiveRecord::Base
  has_many :posts
  validates_presence_of :course_code, :description, :name
end
