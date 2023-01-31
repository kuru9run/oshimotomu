class PromotionBookmarksController < ApplicationController
  def create
    @promotion = Promotion.find(params[:promotion_id])
    bookmark = current_user.promotion_bookmarks.build(promotion_id: @promotion.id)
    bookmark.save!
    render 'change'
  end

  def destroy
    bookmark = current_user.promotion_bookmarks.find(params[:id])
    @promotion = Promotion.find(bookmark.promotion_id)
    bookmark.destroy!
    render 'change'
  end
end
