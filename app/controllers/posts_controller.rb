class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def show
    @post = Post.includes(:comments, comments: [:author]).find(params[:id])
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
  end
end
