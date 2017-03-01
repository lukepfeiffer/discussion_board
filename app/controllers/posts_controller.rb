class PostsController < ApplicationController
  before_action :authenticate_admin, only: [:new, :edit, :destroy]
  expose :post
  expose :comment do
    Comment.new
  end
  expose :comments do
    post.comments.order("created_at DESC")
  end
  expose :courses do
    Course.all
  end
  expose :posts do
    Post.all.paginate(page: params[:page], per_page: 10).order("publish_date DESC")
  end

  def index
  end

  def new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if params[:publish_date].blank?
      post.publish_date = Date.today
    end

    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def destroy
    post.delete
    redirect_to root_path
  end

  private

  def authenticate_admin
    if current_user.nil? || !current_user.is_admin?
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(
      :title,
      :embed_url,
      :course_id,
      :description,
      :publish_date
    )
  end
end
