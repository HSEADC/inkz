module ApplicationHelper
  def meta_tags(content, default)
    content.blank? ? default : content
  end
end
