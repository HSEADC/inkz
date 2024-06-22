class Views::Tattoos::TattooCardComponent < ViewComponent::Base
  def initialize(tattoo:, show_tags: false)
    @tattoo = tattoo
    @show_tags = show_tags
  end

  def render?
    @tattoo.present?
  end
end
