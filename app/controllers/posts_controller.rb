class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def show
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
    @post = Post.includes(:comments, comments: [:author]).find(params[:id])
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
  end

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
