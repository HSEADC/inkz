class Views::Tattoos::TattoosGridComponent < ViewComponent::Base
  erb_template <<-ERB
    <masonry-layout cols="auto" gap="20" maxcolwidth="400" class="<%= @className %>">
      <% @tattoos.each do |tattoo| %>
        <%= render Views::Tattoos::TattooCardComponent.new(tattoo: tattoo, show_tags: false, preview_mode: :disabled) %>
      <% end %>
    </masonry-layout>
  ERB

  def initialize(tattoos:, **className)
    defaultStyles = ''
    @className = [defaultStyles, *className.values].compact.join(' ')
    @tattoos = tattoos
  end
end
