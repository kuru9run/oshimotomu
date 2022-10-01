class FansController < ApplicationController
  def new
    @fan = Fan.new
    @contents_titles = Content.select(:title).distinct
    @content = Content.new
  end
end
