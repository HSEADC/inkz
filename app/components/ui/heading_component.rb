class Ui::HeadingComponent < ViewComponent::Base
  erb_template <<-ERB
    <h1 class="<%= @className %>"><%= raw @text %></h1>
  ERB

  def initialize(text:, **className)
    defaultStyles = 'text-5xl font-medium tracking-tight'
    @className = [defaultStyles, *className.values].compact.join(' ')
    @text = text
  end
end
