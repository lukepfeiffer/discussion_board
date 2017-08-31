class AdminsController < ApplicationController
  before_action :authenticate_admin

  expose :recent_posts do
    Post.limit(6).order('publish_date DESC')
  end

  expose :posts do
    Post.sort(params)
  end

  expose :courses do
    Course.all
  end

  expose :admins do
    User.where(is_admin: true, is_super_user: false)
  end

  expose :users do
    User.where(is_admin: false).order('created_at DESC')
  end

  def overview
  end
end
