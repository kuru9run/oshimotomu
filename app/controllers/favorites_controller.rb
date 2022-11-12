class FavoritesController < ApplicationController
  skip_before_action :require_login

  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(distinct: true).includes(:content, :group).order(created_at: :desc).page(params[:page])
    if logged_in?
      @my_favorite_now = current_user.fans.now.map { |fan| fan.favorite }
      @my_favorite_before = current_user.fans.before.map { |fan| fan.favorite }
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
    fans_now_favorites_before = @favorite.fans.now.map { |fan| fan.user.fans.before.map { |b| b.favorite.name} }
    @chart_before = fans_now_favorites_before[0].group_by(&:itself).map { |g| [g[0], g[1].size] } if fans_now_favorites_before.size > 0
    fans_before_favorites_now = @favorite.fans.before.map { |fan| fan.user.fans.now.map { |n| n.favorite.name } }
    @chart_now = fans_before_favorites_now[0].group_by(&:itself).map { |g| [g[0], g[1].size] } if fans_before_favorites_now.size > 0
  end

  def search
    name = params[:name]
    @suggests = Favorite.where('name LIKE ?', "%#{name}%")
    @state = params[:state]
  end
end
