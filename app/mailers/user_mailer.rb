class UserMailer < ActionMailer::Base
  default from: 'webmaster.uf.ace@gmail.com'

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Registration Confirmation")
  end
end
