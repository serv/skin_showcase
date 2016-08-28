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
    user = User.find_by(username: user_params[:username])

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
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
end
