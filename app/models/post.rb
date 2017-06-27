class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :comments
  validates_presence_of :title, :course_id, :description, :embed_url
  scope :published, -> { where("publish_date <= ?", Date.today) }

  def self.for_course(course_code)
    where( course_id: Course.by_course_code(course_code).id )
  end
end
