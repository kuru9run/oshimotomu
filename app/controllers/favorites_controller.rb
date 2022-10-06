class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all.includes(:content)
  end

  def show
    @favorite = Favorite.find(params[:id])
  end
end
