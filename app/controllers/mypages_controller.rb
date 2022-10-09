class MypagesController < ApplicationController
  def show
    @now_favorites = current_user.fans.now.map { |fan| fan.favorite }
    @before_favorites = current_user.fans.before.map { |fan| fan.favorite }
    @wrote_requests = current_user.requests
    @answered_requests = current_user.answers.map { |answer| answer.request }
    @wrote_promotions = current_user.promotions
    @commented_promotions = current_user.comments.map { |comment| comment.promotion }
  end
end
