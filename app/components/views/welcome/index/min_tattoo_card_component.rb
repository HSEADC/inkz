class Views::Welcome::Index::MinTattooCardComponent < ViewComponent::Base
  def initialize(image:, nickname:, className: '')
    @image = image
    @nickname = nickname
    @className = className
  end
end
