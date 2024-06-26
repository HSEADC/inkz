class Views::Masters::MasterCardTattoosComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="<%= @className %>">
      <% @master_tattoos.shuffle.first(@quantity).each do |tattoo| %>
        <%= link_to tattoo_path(tattoo), class: 'group overflow-hidden' do %>
          <%= image_tag(tattoo.tattoo_image.url, class: 'object-cover s-36 group-hover:scale-105 duration-500', alt: tattoo.title) %>
        <% end %>
      <% end %>
    </div>
  ERB

  def initialize(quantity:, master_tattoos:, **className)
    @quantity = quantity
    @master_tattoos = master_tattoos

    defaultStyles = 'flex col-span-7 gap-2 overflow-hidden rounded-10'
    @className = [defaultStyles, *className.values].compact.join(' ')
  end
end