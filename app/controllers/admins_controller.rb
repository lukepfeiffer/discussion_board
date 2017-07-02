class AdminsController < ApplicationController
  before_action :authenticate_admin

  expose :recent_posts do
    Post.limit(6).order('publish_date DESC')
  end

  expose :posts do
    if params[:user_id].present?
      posts = current_user.posts.order("publish_date DESC")
    elsif params[:order].present?
      posts = Post.all.order("publish_date ASC")
    elsif params[:published].present?
      posts = Post.published.order('created_at DESC')
    else
      posts = Post.all.order("publish_date DESC")
    end

    posts.paginate(page: params[:page], per_page: 10)
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
