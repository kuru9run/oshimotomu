class ContentsController < ApplicationController
  def create
    @content = Content.new(content_params)
    @content.save
    @request = request.headers[:HTTP_TURBO_FRAME]
  end

  def destroy
  end

  private

  def content_params
    params.require(:content).permit(:title)
  end
end
