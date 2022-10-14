class PromotionsController < ApplicationController
  skip_before_action :require_login, only: %i[show index]

  def new
    @promotion = Promotion.new
    @content = Content.new
  end

  def create
    @content = Content.find_by(id: promotion_params[:content_id])
    @promotion = Promotion.new(promotion_params)
    @promotion.user = current_user
    if @promotion.save
      redirect_to promotions_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @promotion = Promotion.find(params[:id])
    @content = Content.new
  end

  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update(promotion_params)
      redirect_to promotion_path(@promotion), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy!
    redirect_to promotions_path
  end

  def show
    @promotion = Promotion.find(params[:id])
    @comments = @promotion.comments
    @comment = Comment.new
  end

  def index
    @q = Promotion.ransack(params[:q])
    @promotions = @q.result(distinct: true).includes(:user, :content).order(created_at: :desc)
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :existence, :decade, :gender, :job, :content_id)
  end
end
