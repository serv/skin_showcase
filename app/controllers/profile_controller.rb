class ProfileController < ApplicationController
  before_action :require_login

  def index
  end

  private

    def require_login
      filter_require_login
    end
end
