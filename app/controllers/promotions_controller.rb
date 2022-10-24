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
    Promotion.transaction do
      @promotion.save!
      unless params[:promotion][:embed_url].blank?
        embed = @promotion.embeds.build(identifier: params[:promotion][:embed_url])
        embed.save!
      end
    end
    redirect_to promotion_path(@promotion), notice: t('.success')
    rescue => e
    flash.now[:alert] = t('.fail')
    render :new, status: :unprocessable_entity
  end

  def edit
    @promotion = Promotion.find(params[:id])
    @content = Content.new
  end

  def update
    @promotion = Promotion.find(params[:id])
    Promotion.transaction do
      @promotion.update!(promotion_params)
      #とりあえず埋め込み動画あったら全削除してから保存する
      @promotion.embeds&.destroy_all
      unless params[:promotion][:embed_url].blank?
        embed = @promotion.embeds.build(identifier: params[:promotion][:embed_url])
        embed.save!
      end
    end
    redirect_to promotion_path(@promotion), notice: t('.success')
    rescue => e
    flash.now[:alert] = t('.fail')
    render :edit, status: :unprocessable_entity
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
    @promotions = @q.result(distinct: true).includes(:user, :content).order(created_at: :desc).page(params[:page])
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :existence, :decade, :gender, :content_id, :group_id)
  end
end
