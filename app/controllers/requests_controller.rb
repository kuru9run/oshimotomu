class RequestsController < ApplicationController
  def index
    @requests = Request.all.includes(:user)
  end

  def show
    @request = Request.find(params[:id])
    fans_before = @request.user.fans.where(state: :before)
    @favorites_before = fans_before.map { |fan| fan.favorite }
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy!
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :existence, :decade, :gender, :job)
  end
end
