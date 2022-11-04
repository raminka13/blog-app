class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
