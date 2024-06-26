class Ui::MarkComponent < ViewComponent::Base
  erb_template <<-ERB
    <mark id="<%= @id %>" class="<%= @className %>"><%= raw @text %></mark>
  ERB

  def initialize(text:, id: '', **className)
    @className = ['px-3 py-1.5 text-lg rounded-md', *className.values].compact.join(' ')
    @id = id
    @text = text
  end
end
