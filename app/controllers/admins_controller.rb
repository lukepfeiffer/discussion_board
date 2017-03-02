class AdminsController < ApplicationController
  before_action :authenticate_admin

  expose :recent_posts do
    Post.limit(6).order('publish_date DESC')
  end

  expose :posts do
    if params[:user_id].present?
      current_user.posts
    elsif params[:order].present? && params[:order] == "recent"
      Post.all.order("publish_date DESC")
    elsif params[:order].present? && params[:order] == "oldest"
      Post.all.order("publish_date ASC")
    else
      Post.all.order("publish_date DESC")
    end
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

  private

  def authenticate_admin
    if current_user.nil? || !current_user.is_admin?
      redirect_to root_path
    end
  end

end
