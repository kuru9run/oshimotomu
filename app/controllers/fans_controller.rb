class FansController < ApplicationController
  def new
    @fan = Fan.new
    @contents_titles = Content.select(:title).distinct
    @content = Content.new
  end

  def create
    @content = Content.find_by(id: favorite_params[:content_id])
    @favorite = Favorite.find_or_create_by(name: favorite_params[:name], type: favorite_params[:type], decade: favorite_params[:decade], gender: favorite_params[:gender], job: favorite_params[:job], content_id: @content&.id)
    @fan = Fan.new(user_id: current_user.id, favorite_id: @favorite.id)
    if @fan.save
      redirect_to new_fan_path
    else
      render :new
    end
  end

  def favorite_params
    params.require(:fan).permit(:name, :type, :decade, :gender, :job, :content_id)
  end
end
