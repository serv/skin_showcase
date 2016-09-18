class AuthenticateController < ApplicationController
  def signup
    @user = User.new
  end

  def signin
    @user = User.new
  end

  def signup_post
    @user = User.new(user_params)

    unless verify_recaptcha?(params[:'g-recaptcha-response'], request.remote_ip)
      flash.now[:error] = 'Failed to verify Recaptcha. Please try again.'
      render 'signup'
      return
    end

    if @user.save
      log_in @user
      redirect_to root_url
    else
      flash.now[:error] = 'Failed to sign up. Please try again.'
      render 'signup'
    end
  end

  def signin_post
    if EmailValidator.valid?(user_params[:username_or_email])
      @user = User.find_by(email: user_params[:username_or_email])
    else
      @user = User.find_by(username: user_params[:username_or_email])
    end

    if @user && @user.authenticate(user_params[:password])
      log_in @user
      redirect_to root_path
    else
      @user = User.new
      flash.now[:error] = 'Failed to sign in. Please try again.'
      render 'signin'
    end
  end

  def sign_out
    log_out if logged_in?
    redirect_to root_url
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
