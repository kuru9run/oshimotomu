class ContentsController < ApplicationController
  def create
    @content = Content.new(content_params)
    @content.save
  end

  private

  def content_params
    params.require(:content).permit(:title)
  end
end
