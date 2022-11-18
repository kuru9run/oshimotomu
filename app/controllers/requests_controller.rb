class RequestsController < ApplicationController
  skip_before_action :require_login, only: %i[show index]
  before_action :set_request, only: %i[edit update destroy]

  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @request = Request.find(params[:id])
    # 元○○推し
    favorites_before_name = @request.user.fans.includes(:favorite).before.map { |fan| fan.favorite.name }
    @favorites_before_name = favorites_before_name.join('、')
    @answers = @request.answers.includes(:user)
    @answer = Answer.new 
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to request_path(@request), notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @request.update(request_params)
      redirect_to request_path(@request), notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @request.destroy!
    redirect_to requests_path, notice: t('.success')
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :existence, :decade, :gender)
  end

  def set_request
    @request = current_user.requests.find(params[:id])
  end
end
