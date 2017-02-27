class PostsController < ApplicationController
  expose :post
  expose :posts do
    Post.all
  end

  def index
    @string = 'Nulla varius pharetra metus, et mollis diam tincidunt sed. Nulla ac ante nunc. Cras eleifend risus non eros molestie euismod. Aenean non sem orci. Aenean varius vitae risus molestie interdum. Nam ut sodales ipsum. Nulla vulputate, tortor sed convallis congue, purus libero dignissim nisi, non consectetur nulla felis non lacus. Morbi ut lorem mattis, sollicitudin metus ut, mollis magna. Sed est felis, ullamcorper ac tellus ac, facilisis cursus arcu. Integer mauris sapien, pulvinar a lacinia in, dictum nec ipsum. Proin at diam non quam porta semper. Duis ullamcorper eleifend odio, eget eleifend metus molestie blandit.'
  end

  def temp_show
    @string = 'Nulla varius pharetra metus, et mollis diam tincidunt sed. Nulla ac ante nunc. Cras eleifend risus non eros molestie euismod. Aenean non sem orci. Aenean varius vitae risus molestie interdum. Nam ut sodales ipsum. Nulla vulputate, tortor sed convallis congue, purus libero dignissim nisi, non consectetur nulla felis non lacus. Morbi ut lorem mattis, sollicitudin metus ut, mollis magna. Sed est felis, ullamcorper ac tellus ac, facilisis cursus arcu. Integer mauris sapien, pulvinar a lacinia in, dictum nec ipsum. Proin at diam non quam porta semper. Duis ullamcorper eleifend odio, eget eleifend metus molestie blandit.Nulla varius pharetra metus, et mollis diam tincidunt sed. Nulla ac ante nunc. Cras eleifend risus non eros molestie euismod. Aenean non sem orci. Aenean varius vitae risus molestie interdum. Nam ut sodales ipsum. Nulla vulputate, tortor sed convallis congue, p'
  end

  def new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(
      :title,
      :embed_url,
      :description,
      :publish_date
    )
  end
end
