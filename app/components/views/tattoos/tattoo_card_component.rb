class Views::Tattoos::TattooCardComponent < ViewComponent::Base
  PREVIEW_MODE_STYLES = {
    :enabled => "aspect-square h-[45vh] hover:opacity-80 duration-300 overflow-hidden",
    :disabled => "h-auto"
  }.freeze

  def initialize(tattoo:, show_tags: false, preview_mode: :disabled, className: '')
    @tattoo = tattoo
    @show_tags = show_tags
    @preview_mode = preview_mode
    @className = className
  end

  def render?
    @tattoo.present?
  end

  def classes
    ["relative group", @className, PREVIEW_MODE_STYLES[@preview_mode]].join(" ")
  end
end
