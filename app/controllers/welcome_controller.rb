class WelcomeController < ApplicationController
    def index

    # META TAGS
    @page_title = 'ГЛАВНАЯ'
    @page_description = 'Привет! Это главная'
    @page_keywords = 'инкз, inkz'

    @subscription = Subscription.new
    end
end
