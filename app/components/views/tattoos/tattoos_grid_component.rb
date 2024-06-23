class Views::Tattoos::TattoosGridComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="MASONRY_GRID <%= @className %>">
      <% @tattoos_data.each do |tattoo| %>
        <%= render Views::Tattoos::TattooCardComponent.new(tattoo: tattoo, show_tags: false, preview_mode: :disabled, className: "MASONRY_GRID_EL") %>
        <div class="gutter-sizer"></div>
      <% end %>
    </div>
  ERB

  def initialize(tattoos:, **className)
    defaultStyles = 'border-2 border-black'
    @className = [defaultStyles, *className.values].compact.join(' ')
    @tattoos_data = tattoos
  end
end
