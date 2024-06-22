class Ui::CaptionComponent < ViewComponent::Base
  erb_template <<-ERB
    <p class="<%= @className %>"><%= raw @text %></p>
  ERB

  def initialize(text:, **className)
    defaultStyles = 'text-2xl sm:text-lg tracking-tight text-custom-gray'
    @className = [defaultStyles, *className.values].compact.join(' ')
    @text = text
  end
end
