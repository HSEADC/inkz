module ApplicationHelper
  def custom_meta_tags(content, options = {})
    content.blank? ? options[:default] : content
  end
end
