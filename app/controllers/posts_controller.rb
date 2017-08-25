class PostsController < ApplicationController
  before_action :authenticate_admin, only: [:new, :edit, :destroy, :create, :update]

  expose :post
  expose :comment do
    Comment.new
  end

  expose :comments do
    post.comments.where(comment_id: nil).order("created_at DESC")
  end

  expose :courses do
    Course.all
  end

  expose :posts do
    if params[:course_code].present?
      posts = Post.for_course(params[:course_code])
    elsif params[:search].present?
      posts = Post.fuzzy_search(params[:search])
    else
      posts = Post.all
    end

    posts.paginate(page: params[:page], per_page: 10).order("publish_date DESC")
  end

  expose :reply_comment do
    Comment.new
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
      flash[:success] = 'Post successfully created!'
      redirect_to post_path(post)
    else
      flash[:danger] = 'Post successfully was not saved!'
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
      flash[:success] = 'Post successfully updated!'
      redirect_to post_path(post)
    else
      flash[:danger] = 'Post was not updated!'
      render :edit
    end
  end

  def destroy
    post.delete
    flash[:success] = 'Post was deleted!'
    redirect_to root_path
  end

  private

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
