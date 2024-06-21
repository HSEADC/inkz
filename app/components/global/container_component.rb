class Global::ContainerComponent < ViewComponent::Base
  erb_template <<-ERB
    <main class="<%= @className %>"><%= content %></main>
  ERB

  def initialize()
    @className = 'w-[90vw] mx-auto'
  end
end
