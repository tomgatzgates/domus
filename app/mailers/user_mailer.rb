class UserMailer < ApplicationMailer
  def login_link(user)
    @user = user
    token = user.generate_token
    host = Rails.application.secrets.host
    @login_link = "#{host}/auth?token=#{token}"

    mail(to: @user.email, subject: 'Log in to Domus')
  end
end
