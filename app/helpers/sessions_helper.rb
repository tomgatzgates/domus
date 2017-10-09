module SessionsHelper
  def authorise
    return if current_user.present?
    redirect_to login_path, alert: 'Please log in to view this page.'
  end

def current_user
    User.find_by(email: session[:email])
  end

  def login(user)
    user.expire_token!
    session[:email] = user.email
  end

  def logout
    current_user.expire_token! if current_user
    session[:email] = nil
  end
end
