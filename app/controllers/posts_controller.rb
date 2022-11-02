class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(:comments).order(created_at: :desc)
  end

  def show
    @user = User.includes(:posts).find(params[:user_id])
    @post = Post.includes(:comments).find(params[:id])
    @comments = Comment.where(post_id: @post.id).includes(:author).order(created_at: :asc)
  end

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_posts_path(current_user.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
