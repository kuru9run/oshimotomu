class PromotionsController < ApplicationController
  skip_before_action :require_login, only: %i[show index]
  before_action :set_promotion, only: %i[edit update destroy]

  def new
    @promotion = Promotion.new
  end

  def create
    @content = Content.find_by(id: promotion_params[:content_id])
    @promotion = Promotion.new(promotion_params)
    @promotion.user = current_user
    Promotion.transaction do
      @promotion.save!
      10.times do |i|
        unless params["embed_url_#{i+1}"].blank?
          embed = @promotion.embeds.build(identifier: params["embed_url_#{i+1}"], embeddable_media: params["embed_media_#{i+1}"])
          embed.save!
        end
      end
    end
    redirect_to promotion_path(@promotion), notice: t('.success')
    rescue => e
    flash.now[:alert] = t('.fail')
    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    Promotion.transaction do
      @promotion.update!(promotion_params)
      #とりあえず埋め込み動画あったら全削除してから保存する
      @promotion.embeds&.destroy_all
      10.times do |i|
        unless params["embed_url_#{i+1}"].blank?
          embed = @promotion.embeds.build(identifier: params["embed_url_#{i+1}"], embeddable_media: params["embed_media_#{i+1}"])
          embed.save!
        end
      end
    end
    redirect_to promotion_path(@promotion), notice: t('.success')
    rescue => e
    flash.now[:alert] = t('.fail')
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @promotion.destroy!
    redirect_to promotions_path, notice: t('.success')
  end

  def show
    @promotion = Promotion.find(params[:id])
    @comments = @promotion.comments.includes(:user)
    @comment = Comment.new
  end

  def index
    @q = Promotion.ransack(params[:q])
    @promotions = @q.result(distinct: true).includes(:user, :content, :group).order(created_at: :desc).page(params[:page])
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :existence, :decade, :gender, :content_id, :group_id)
  end

  def set_promotion
    @promotion = current_user.promotions.find(params[:id])
  end
end
