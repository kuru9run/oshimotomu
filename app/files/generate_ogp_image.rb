class GenerateOgpImage
  BASE_IMAGE_PATH = './app/assets/images/ogp_template.png'.freeze
  FONT_PATH = './app/assets/font/ZenMaruGothic-Regular.ttf'.freeze
  GRAVITY_TITLE = 'center'.freeze
  TEXT_POSITION_TITLE = '0.0'.freeze
  COLOR_CODE = '#592960'.freeze
  FONT_SIZE_TITLE = 48
  # 1行あたり16文字まで
  INDENTION_COUNT = 16
  # 6行まで出力
  ROW_LIMIT = 6

  def initialize(post)
    @model = post.class.name
    @text = if @model == 'Promotion'
              "#{post.name}さんの布教"
            elsif @model == 'Request'
              "【求】#{post.title}"
            end
  end

  def generate_ogp_image
    # ベース画像取得
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    # 画像に投稿タイトルを埋め込み
    image.combine_options do |config|
      config.font FONT_PATH
      config.gravity GRAVITY_TITLE
      config.pointsize FONT_SIZE_TITLE
      config.fill COLOR_CODE
      config.annotate  "#{TEXT_POSITION_TITLE}", "#{prepare_text(@text)}"
    end
  end

  private
  def prepare_text(text)
    # 1行あたりの文字数までで配列にする→最大行数までの連続した配列を取得→改行でjoin
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end