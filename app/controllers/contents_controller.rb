class ContentsController < ApplicationController
  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to new_fan_path
    else
      render 'fans/new'
    end
  end

  def destroy
  end

  private

  def content_params
    params.require(:content).permit(:title)
  end
end
