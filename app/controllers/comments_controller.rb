class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to promotion_path(comment.promotion)
    else
      render 'promotions#show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to promotion_path(comment.promotion)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(promotion_id: params[:promotion_id])
  end
end
