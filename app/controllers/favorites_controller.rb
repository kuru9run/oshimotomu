class FavoritesController < ApplicationController
  skip_before_action :require_login

  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(distinct: true).includes(:content, :group).order(created_at: :desc).page(params[:page])
    if logged_in?
      @my_favorite_now = current_user.fans.includes(favorite: %i[content group]).now.map(&:favorite)
      @my_favorite_before = current_user.fans.includes(favorite: %i[content group]).before.map(&:favorite)
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
    # 現役ファンの過去の推し
    fans_now_favorites_before = []
    @favorite.fans.now.each { |fan| fan.user.fans.before.each { |b| fans_now_favorites_before.push(b.favorite) } }
    @chart_before = fans_now_favorites_before.group_by(&:itself).map{ |key, value| [key.name, value.count] }.to_h if fans_now_favorites_before.size > 0
    # 過去ファンの今の推し
    fans_before_favorites_now = []
    @favorite.fans.before.each { |fan| fan.user.fans.now.each { |n| fans_before_favorites_now.push(n.favorite) } }
    @chart_now = fans_before_favorites_now.group_by(&:itself).map { |key, value| [key.name, value.count] }.to_h if fans_before_favorites_now.size > 0
  end

  def search
    name = params[:name]
    @suggests = Favorite.where('name LIKE ?', "%#{name}%")
    @state = params[:state]
  end
end
