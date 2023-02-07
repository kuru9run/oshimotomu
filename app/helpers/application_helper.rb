module ApplicationHelper
  def page_title(page_title = '')
    base_title = '求：推し'
    page_title.empty? ? base_title : page_title + '  ･*' + base_title + '⋆｡ '
  end

  def og_title(og_title = '')
    base_title = '求：推し'
    og_title.empty? ? base_title : og_title + '･*' + base_title + '⋆｡'
  end

  def ogp_image(ogp_image = '')
    base_image = "ogp_default.png"
    ogp_image.empty? ? base_image : ogp_image
  end
end
