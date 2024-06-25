class Views::Masters::MasterCardComponent < ViewComponent::Base
  def initialize(master:)
    @master = master
  end
end
