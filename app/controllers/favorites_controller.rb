class FavoritesController < ApplicationController
  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(distinct: true).includes(:content)
    if logged_in?
      @my_favorite_now = current_user.fans.now.map { |fan| fan.favorite }
      @my_favorite_before = current_user.fans.before.map { |fan| fan.favorite }
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end
end
