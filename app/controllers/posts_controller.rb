class PostsController < ApplicationController
  before_action :authenticate_admin, only: [:new, :edit, :destroy, :create, :update]

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
    if params[:course_code].present?
      course = Course.find_by(course_code: params[:course_code])
      Post.where(course_id: course.id).paginate(page: params[:page], per_page: 10).order("publish_date DESC")
    elsif params[:search].present?
      Post.fuzzy_search(params[:search]).paginate(page: params[:page], per_page: 10).order("publish_date DESC")
    else
      Post.all.paginate(page: params[:page], per_page: 10).order("publish_date DESC")
    end
  end

  def index
    if params[:page].present?
      upper_bounds = params[:page].to_i * 10
      upper_bounds < posts.count ? @upper_bounds = upper_bounds : @upper_bounds = posts.count
      @lower_bounds = params[:page].to_i * 10 - 9
    else
      @lower_bounds = 1
      posts.count > 10 ? @upper_bounds = 10 : @upper_bounds = posts.count
    end
  end

  def new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if params[:post][:publish_date].blank?
      post.publish_date = Date.today
    end

    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def update
    post = Post.find(params[:id])

    if params[:post][:publish_date].blank?
      post.publish_date = Date.today
    end

    post.update(post_params)

    if post.save
      redirect_to post_path(post)
    else
      redirect_to edit_posts_path(post.id)
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
      :image_url,
      :publish_date
    )
  end
end
