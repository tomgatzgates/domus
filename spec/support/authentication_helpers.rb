module AuthenticationHelpers
  def login_as(user)
    session[:email] = user.email
  end
end
