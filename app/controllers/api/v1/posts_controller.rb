class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.posts
  end

  def show
    post = Post.find(params[:id])
    if post.comments_counter.zero?
      render json: post.comments_counter
    else
      render json: post.comments
    end
  end
end
