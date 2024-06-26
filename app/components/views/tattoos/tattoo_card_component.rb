class Views::Tattoos::TattooCardComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions
  
  PREVIEW_MODE_STYLES = {
    :enabled => "aspect-square h-[45vh] hover:opacity-80 duration-300 overflow-hidden",
    :disabled => "h-auto"
  }.freeze

  def initialize(tattoo:, show_tags: false, preview_mode: :disabled)
    @tattoo = tattoo
    @show_tags = show_tags
    @preview_mode = preview_mode
  end

  def render?
    @tattoo.present?
  end

  def className
    ["relative group", PREVIEW_MODE_STYLES[@preview_mode]].join(" ")
  end
end
