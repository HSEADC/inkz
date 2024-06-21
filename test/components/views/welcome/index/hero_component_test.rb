# frozen_string_literal: true

require "test_helper"

class Views::Welcome::Index::HeroComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    # assert_equal(
    #   %(<span>Hello, components!</span>),
    #   render_inline(Views::Welcome::Index::HeroComponent.new(message: "Hello, components!")).css("span").to_html
    # )
  end
end
