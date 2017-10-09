class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.login_link(@user).deliver_later

      redirect_to root_path, notice: 'Welcome! We have sent you the link to login to our app'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
