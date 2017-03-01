class AdminsController < ApplicationController

  expose :recent_posts do
    Post.limit(6).order('publish_date DESC')
  end

  expose :courses do
    Course.all
  end

  expose :admins do
    User.where(is_admin: true)
  end

  expose :users do
    User.where(is_admin: false).order('created_at DESC')
  end

  def overview
  end

end
