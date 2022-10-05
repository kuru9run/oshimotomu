class FansController < ApplicationController
  def new
    @fan = Fan.new
    @content = Content.new
    @fans_now = Fan.where(state: 'now').includes(:favorite)
    @fans_before = Fan.where(state: 'before').includes(:favorite)
  end

  def create
    @content = Content.find_by(id: favorite_params[:content_id])
    @favorite = Favorite.find_or_create_by(name: favorite_params[:name], existence: favorite_params[:existence], decade: favorite_params[:decade], gender: favorite_params[:gender], job: favorite_params[:job], content_id: @content&.id)
    @fan = Fan.new(user_id: current_user.id, favorite_id: @favorite.id)
    @favorite.save
    if @fan.save
      redirect_to new_fan_path, t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def favorite_params
    params.require(:fan).permit(:name, :existence, :decade, :gender, :job, :content_id)
  end
end
