class Api::V1::CommentsController < Api::V1::ApplicationController
  def create
    comment = Comment.new(
      text: params[:comment][:text],
      post_id: params[:post_id],
      author_id: current_user.id
    )
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end
end
