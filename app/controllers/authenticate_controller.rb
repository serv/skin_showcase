class AuthenticateController < ApplicationController
  def signup
    @user = User.new
  end

  def signin
  end

  def signup_post
  end
end
