module SessionsHelper
  def current_user
    User.find_by(email: session[:email])
  end
end
