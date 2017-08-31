class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :comments
  validates_presence_of :title, :course_id, :embed_url
  scope :published, -> { where("publish_date <= ?", Date.today) }

  def self.for_course(course_code)
    where( course_id: Course.by_course_code(course_code).id )
  end

  def self.sort(params)
    if params[:user_id].present?
      posts = User.find(params[:user_id]).posts.order("publish_date DESC")
    elsif params[:order].present?
      posts = Post.all.order("publish_date ASC")
    elsif params[:published]
      posts = Post.published.order('created_at DESC')
    else
      posts = Post.all.order("publish_date DESC")
    end

    posts.paginate(page: params[:page], per_page: 10)
  end
end
