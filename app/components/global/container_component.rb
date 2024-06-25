class Global::ContainerComponent < ViewComponent::Base
  erb_template <<-ERB
    <main class="<%= @className %>"><%= content %></main>
  ERB

  def initialize()
    @className = "#{Constants::WEBSITE_WIDTH} pt-7 sm:pt-5 pb-44 xl:pb-32 sm:pb-24"
  end
end
