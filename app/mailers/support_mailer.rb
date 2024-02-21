class SupportMailer < ApplicationMailer
  def user_support_request_email
    attachments.inline['logo.svg'] = File.read('app/assets/images/logo.svg')

    email = params[:support][:email]
    mail(to: email, subject: 'Ваше обращение в поддержку принято')
  end

  def admin_support_request_email
    admin_email = 'admin@inkz.ru'

    @email = params[:support][:email]
    @comment = params[:support][:comment]
    mail(to: admin_email, subject: 'Новое обращение в поддержку')
  end
end
