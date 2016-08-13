class AuthenticateController < ApplicationController
  def signup
    @user = User.new
  end

  def signin
  end

  def signup_post
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      render 'signup'
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
