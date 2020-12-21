class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_welcome_mail.subject
  #
  default from: "example@gmail.com"
  
  def user_welcome_mail(user)
    @user = user
	  mail to: @user.email, subject: 'Welcome to Our Application!'
  end
  
end
