class MypagesController < ApplicationController
  def show
    @now_favorites = current_user.fans.now.map { |fan| fan.favorite }
    @before_favorites = current_user.fans.before.map { |fan| fan.favorite }
  end
end
