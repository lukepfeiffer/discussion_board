class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :comments
  validates_presence_of :title, :course_id, :description, :embed_url
end
