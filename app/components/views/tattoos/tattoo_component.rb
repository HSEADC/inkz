class Views::Tattoos::TattooComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions
  include TattoosHelper

  def initialize(tattoo:, master:)
    @tattoo = tattoo
    @master = master  
  end
end
