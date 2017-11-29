class UserMailer < ApplicationMailer
  default from: "donotreply@sucampusenv.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def send_welcome_mail(user)
    @user = user

    mail to: user.email, subject: "Welcome to SU Campus & Environment", from: "donotreply@sucampusenv.com"
  end
end
