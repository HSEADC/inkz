class Views::Tattoos::TattoosGridComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="<%= @className %>">
      <% @tattoos_data.each do |tattoo| %>
        <%= render Views::Tattoos::TattooCardComponent.new(tattoo: tattoo, show_tags: false, preview_mode: :disabled) %>
      <% end %>
  ERB

  def initialize(tattoos:, **className)
    defaultStyles = 'grid grid-cols-5 border-2 border-black p-2'
    @className = [defaultStyles, *className.values].compact.join(' ')
    @tattoos_data = tattoos
  end
end
