class Ui::MarkComponent < ViewComponent::Base
  erb_template <<-ERB
    <mark class="<%= @className %>"><%= raw @text %></mark>
  ERB

  def initialize(text:, **className)
    @className = ['px-2 py-1', *className.values].compact.join(' ')
    @text = text
  end
end
