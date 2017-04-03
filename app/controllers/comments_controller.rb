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

  def create_reply
    comment = Comment.new(comment_params)
    comment.comment_id = params[:comment_id]
    comment.user_id = current_user.id
    if comment.save
      redirect_to post_path(params[:post_id])
    else
      redirect_to post_path(params[:post_id])
    end
  end

  def replies
    comment = Comment.find(params[:comment_id])
    @comments = comment.comments.order('created_at DESC')
    render partial: 'replies'
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to post_path(params[:post_id])
  end

  def like
    comment = Comment.find(params[:comment_id])
    get_vote(comment)
    if @vote.value < 1
      @vote.value = 1
      if @vote.save
        head :ok
      end
    else
      head :no_content
    end
  end

  def dislike
    comment = Comment.find(params[:comment_id])
    get_vote(comment)
    if @vote.value > -1
      @vote.value = -1
      if @vote.save
        head :ok
      end
    else
      head :no_content
    end
  end

  private

  def authenticate_user
    if current_user.nil?
      redirect_to root_path
    end
  end

  def get_vote(comment)
    @vote = comment.votes.find_by_user_id(current_user.id)
    unless @vote
      @vote = Vote.create(:user_id => current_user.id, :value => 0)
      comment.votes << @vote
    end
  end

  def comment_params
    params.require(:comment).permit(
      :post_id,
      :body
    )
  end
end
