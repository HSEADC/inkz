# app/components/views/masters/master_card_component.rb

class Views::Masters::MasterCardComponent < ViewComponent::Base
  def initialize(master:)
    @master = master
  end
end
