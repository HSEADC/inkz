class Views::Masters::MasterComponent < ViewComponent::Base
  def initialize(master:)
    @master = master
  end
end
