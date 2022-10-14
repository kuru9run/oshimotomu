class RequestsController < ApplicationController
  skip_before_action :require_login, only: %i[show index]
  
  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def show
    @request = Request.find(params[:id])
    fans_before = @request.user.fans.where(state: :before)
    @favorites_before = fans_before.map { |fan| fan.favorite }
    @answers = @request.answers
    @answer = Answer.new 
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to requests_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to request_path(@request), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
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
