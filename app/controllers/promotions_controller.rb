class PromotionsController < ApplicationController
  def new
    @promotion = Promotion.new
    @content = Content.new
  end

  def create
    @content = Content.find_by(id: promotion_params[:content_id])
    @promotion = Promotion.new(promotion_params)
    @promotion.user = current_user
    if @promotion.save
      redirect_to promotions_path
    else
      render :new
    end
  end

  def edit
    @promotion = Promotion.find(params[:id])
  end

  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update(promotion_params)
      redirect_to promotions_path
    else
      render :edit
    end
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def index
    @promotions = Promotion.all.includes(:user)
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :existence, :decade, :gender, :job, :content_id)
  end
end
