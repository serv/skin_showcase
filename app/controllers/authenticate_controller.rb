class AuthenticateController < ApplicationController
  def signup
    @user = User.new
  end

  def signin
    @user = User.new
  end

  def signup_post
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'signup'
    end
  end

  def signin_post
    user = nil

    if EmailValidator.valid?(user_params[:username_or_email])
      user = User.find_by(email: user_params[:username_or_email])
    else
      user = User.find_by(username: user_params[:username_or_email])
    end

    if user && user.authenticate(user_params[:password])
      log_in user
      redirect_to root_path
    else
      flash[:error] = 'Failed to sign in. Please try again.'
      render 'signin'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username,
                                   :username_or_email,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
end
