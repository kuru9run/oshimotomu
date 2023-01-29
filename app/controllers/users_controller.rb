class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to new_fan_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @now_favorites = @user.fans.includes(:favorite).now.map { |fan| fan.favorite }
    @before_favorites = @user.fans.includes(:favorite).before.map { |fan| fan.favorite }
    @wrote_requests = @user.requests
    answered_requests = @user.answers.includes(:request).map { |answer| answer.request }
    @answered_requests = answered_requests.uniq
    @wrote_promotions = @user.promotions
    commented_promotions = @user.comments.includes(:promotion).map { |comment| comment.promotion }
    @commented_promotions = commented_promotions.uniq
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
