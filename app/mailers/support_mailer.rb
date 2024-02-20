class SupportMailer < ApplicationMailer
  def user_support_request_email
    # @user = params[:user]
    # @url = 'http://example.com/login'
    mail(to: 'user1@inkz.ru', subject: 'Ваше обращение в поддержку принято')
  end

  def admin_support_request_email
  end
end
