class SettingsController < ApplicationController
  before_action :require_login

  def index
  end

  def put_email
    if user_params[:email].empty? || user_params[:email_confirmation].empty?
      flash.now[:error] = 'Failed to change email. Emails do not match.'
      render 'index'
      return
    end

    if user_params[:email] != user_params[:email_confirmation]
      flash.now[:error] = 'Failed to change email. Emails do not match.'
      render 'index'
      return
    end

    if current_user.update_attribute('email', user_params[:email])
      redirect_to settings_url
    else
    end
  end

  def password
  end

  def change_password
    if user_params[:password].empty? || user_params[:password_confirmation].empty?
      flash.now[:error] = 'Failed to change password. Passwords do not match.'
      render 'password'
      return
    end

    if user_params[:password] != user_params[:password_confirmation]
      flash.now[:error] = 'Failed to change password. Passwords do not match.'
      render 'password'
      return
    end

    if current_user.update_attributes!(user_params)
      redirect_to settings_password_url
    else
    end
  end

  private

    def user_params
      params.require(:user).permit(:email,
                                   :email_confirmation,
                                   :password,
                                   :password_confirmation)
    end

    def require_login
      filter_require_login
    end
end
