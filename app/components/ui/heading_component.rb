# frozen_string_literal: true

class Ui::HeadingComponent < ViewComponent::Base
  def initialize(text:, className:)
    @text = text
    @className = className
  end

end
