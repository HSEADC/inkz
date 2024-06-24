# frozen_string_literal: true

class Views::Tattoos::TattooComponent < ViewComponent::Base
  def initialize(tattoo:, master:)
    @tattoo = tattoo
    @master = master 
  end

end
