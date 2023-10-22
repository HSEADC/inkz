class WelcomeController < ApplicationController
  def index
    @color = generate_random_hex_color
    @subscription = Subscription.new
  end

  def about
    @color = generate_random_hex_color
  end

  private

  def generate_random_hex_color
    '#' + (1..6).map { '0123456789abcdef'.chars.sample }.join
  end
end
