class LikesController < ApplicationController
  def create
    @user = Post.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]
    pp params

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
