module ApplicationHelper
  def default_meta_content(content, default)
    content.blank? ? default : content
  end
end
