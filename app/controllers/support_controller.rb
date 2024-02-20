class SupportController < ApplicationController
  def request_support
    SupportMailer.user_support_request_email.deliver_now
  end
end
