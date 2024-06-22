class Views::Tattoos::TattooCardComponent < ViewComponent::Base
  PREVIEW_MODE_STYLES = {
    true: "aspect-square h-[45vh]",
    false: "h-auto"
  }.freeze

  def initialize(tattoo:, show_tags: false, preview_mode: false)
    @tattoo = tattoo
    @show_tags = show_tags
    @preview_mode = preview_mode
  end

  def render?
    @tattoo.present?
  end

  def className
    "#{PREVIEW_MODE_STYLES[@preview_mode]} relative group"
  end
end
