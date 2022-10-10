class ContentsController < ApplicationController
  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to params[:content][:route]
    else
      flash.now[:alert] = '作品タイトルを保存できませんでした'
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
