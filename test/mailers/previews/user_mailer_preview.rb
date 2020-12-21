# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/user_welcome_mail
  def user_welcome_mail
    UserMailer.user_welcome_mail
  end

end
