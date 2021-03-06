class Course < ActiveRecord::Base
  has_many :posts
  validates_presence_of :course_code, :name

  scope :by_course_code, -> (course_code) { find_by(course_code: course_code) }
end
