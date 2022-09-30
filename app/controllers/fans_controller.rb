class FansController < ApplicationController
  def new
    @fan = Fan.new
  end
end
