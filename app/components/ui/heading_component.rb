class Ui::HeadingComponent < ViewComponent::Base
  erb_template <<-ERB
    <h1 class="<%= @className %>"><%= raw @text %></h1>
  ERB

  def initialize(text:, className:)
    @text = text
    @className = className
  end
end
