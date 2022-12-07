class GenerateOgpImage
  BASE_IMAGE_PATH = './app/assets/images/ogp_template.png'.freeze
  FONT_PATH = './app/assets/font/ZenMaruGothic-Regular.ttf'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '0.0'.freeze
  COLOR_CODE = '#592960'.freeze
  FONT_SIZE = 48
  INDENTION_COUNT = 15
  ROW_LIMIT = 20

  def initialize(post)
    @model = post.class.name
    @text = if @model == 'Promotion'
              "#{post.name}さんの布教"
            elsif @model == 'Request'
              "【求】#{post.title}"
            end
    @user_name = post.user.name
    @id = post.id
  end

  def generate_ogp_image
    # ベース画像取得
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    # 画像に投稿タイトルを埋め込み
    image.combine_options do |config|
      config.font FONT_PATH
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.fill COLOR_CODE
      config.annotate  "#{TEXT_POSITION}", "#{@text}"
    end
  end
end