class AdminsController < ApplicationController

  expose :recent_posts do
    Post.limit(5).order('publish_date DESC')
  end

  expose :courses do
    Course.all
  end

  expose :admins do
    User.where(is_admin: true)
  end
  def overview
  end
  def index
  end
end
