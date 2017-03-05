class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  expose :comment

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_to post_path(params[:comment][:post_id])
    else
      redirect_to post_path(params[:comment][:post_id])
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to post_path(params[:post_id])
  end
  private

  def authenticate_user
    if current_user.nil?
      redirect_to root_path
    end
  end

  def comment_params
    params.require(:comment).permit(
      :post_id,
      :body
    )
  end
end
