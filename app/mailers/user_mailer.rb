class UserMailer < ApplicationMailer
  def login_link(user)
    @user = user
    @token = user.generate_token

    mail(to: @user.email, subject: 'Log in to Domus')
  end
end
