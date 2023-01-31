class RequestBookmarksController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    bookmark = current_user.request_bookmarks.build(request_id: @request.id)
    bookmark.save!
    render 'change'
  end

  def destroy
    bookmark = current_user.request_bookmarks.find(params[:id])
    @request = Request.find(bookmark.request_id)
    bookmark.destroy!
    render 'change'
  end
end
