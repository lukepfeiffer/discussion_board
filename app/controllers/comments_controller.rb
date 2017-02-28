class CommentsController < ApplicationController
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

  def comment_params
    params.require(:comment).permit(
      :post_id,
      :body
    )
  end
end
