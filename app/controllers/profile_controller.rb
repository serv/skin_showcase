class ProfileController < ApplicationController
  before_action :require_login

  def index
    @reviews = current_user.reviews
    @ratings = current_user.ratings
    @ownits = current_user.ownits
    @wantits = current_user.wantits
  end

  private

    def require_login
      filter_require_login
    end
end
