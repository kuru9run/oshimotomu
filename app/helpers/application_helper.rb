module ApplicationHelper
  def page_title(page_title = '')
    base_title = '求：推し'
    page_title.empty? ? base_title : page_title + '  ･*' + base_title + '⋆｡ '
  end

  def ogp_title(ogp_title = '')
    base_title = '求：推し'
    ogp_title.empty? ? base_title : ogp_title + '  ･*' + base_title + '⋆｡ '
  end

  def ogp_image(ogp_image = '')
    base_image = "ogp_default.png"
    ogp_image.empty? ? base_image : ogp_image
  end
end
