class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(:comments).order(created_at: :desc)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.includes(:posts).find(params[:user_id])
    @post = Post.includes(:comments).find(params[:id])
    @comments = Comment.where(post_id: @post.id).includes(:author).order(created_at: :asc)
  end

  def destroy
    @post = Post.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Post Deleted!' }
    end
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
