class Views::Masters::MasterComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions
  include MastersHelper

  def initialize(master:)
    @master = master
  end
end
