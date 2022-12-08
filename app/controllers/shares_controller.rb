class SharesController < ApplicationController
  before_action :set_post, only: %i[generate]
  skip_before_action :require_login

  def generate
    ogp = GenerateOgpImage.new(@post)
    image = ogp.generate_ogp_image.tempfile.open.read
    send_data image, type: 'image/png', disposition: 'inline'
  end

  private
  def set_post
    @post = if params[:model] == 'Promotion'
              Promotion.find(params[:id])
            elsif params[:model] == 'Request'
              Request.find(params[:id])
            end
  end
end
