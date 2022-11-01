class UsersController < ApplicationController
  def index
    if current_user
      @users = User.all.order(id: :asc)
      @current = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
    
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
