class WelcomeController < ApplicationController
    def index
        @subscription = Subscription.new
    end
end
