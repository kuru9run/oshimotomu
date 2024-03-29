class TimelinesController < ApplicationController
  def show
    ids = Request.includes(:user).select{ |x| current_user.following?(x.user) }.pluck(:id)
    @requests = Request.where(id: ids).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def requests
    ids = Request.includes(:user).select{ |x| current_user.following?(x.user) }.pluck(:id)
    @requests = Request.where(id: ids).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def promotions
    ids = Promotion.includes(:user).select{ |x| current_user.following?(x.user) }.pluck(:id)
    @promotions = Promotion.where(id: ids).includes(:user, :content, :group).order(created_at: :desc).page(params[:page])
  end
end
