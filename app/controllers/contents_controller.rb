class ContentsController < ApplicationController
  def create
    @content = Content.new(content_params)
    if @content.save
      flash.now[:success] = t('.success')
    else
      flash.now[:alert] = t('.fail')
    end
    @flash = flash
    # createテンプレートをレンダリング
  end

  private

  def content_params
    params.require(:content).permit(:title)
  end
end
