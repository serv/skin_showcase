class ProfileController < ApplicationController
  before_action :require_login

  def index
    @reviews = current_user.reviews
  end

  private

    def require_login
      filter_require_login
    end
end
