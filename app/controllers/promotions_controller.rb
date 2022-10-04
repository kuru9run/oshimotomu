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
  end

  def show
  end

  def index
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :existence, :decade, :gender, :job, :content_id)
  end
end
