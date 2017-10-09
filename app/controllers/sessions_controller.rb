class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      UserMailer.login_link(user).deliver_later
      flash.notice = 'We have sent you the link to login to our app'
    else
      flash.notice = 'Sorry, we do not recognise that email address.'
    end

    redirect_to login_path
  end

  def auth
    user = User.where(token: params[:token]).where('token_expires_at > ?', Time.now.utc).first
  end
end
