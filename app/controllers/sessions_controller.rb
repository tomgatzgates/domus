class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      UserMailer.login_link(user).deliver_later
      flash.notice = 'We have sent you the link to login to our app.'
    else
      flash.notice = 'Sorry, we do not recognise that email address.'
    end

    redirect_to login_path
  end

  def destroy
    session.delete(:email).tap do |was_logged_in |
      flash.notice = was_logged_in ? 'Logged out.' : 'Already logged out.'
    end

    redirect_to root_path
  end

  def auth
    user = User.where(token: params[:token]).where('token_expires_at > ?', Time.now.utc).first

    if user
      login_user(user)
      redirect_to root_path, notice: 'Successfully logged in.'
    else
      redirect_to login_path, notice: 'Sorry, that token is invalid.'
    end
  end

  private

  def login_user(user)
    user.expire_token!
    session[:email] = user.email
  end
end
