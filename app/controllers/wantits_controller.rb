class WantitsController < ApplicationController
  before_action :require_login

  def create
    return if my_wantit_exists?

    @wantit = Wantit.new(wantit_params)
    @wantit.user_id = current_user.id

    if @wantit.save
      render json: @wantit
    else
      flash.now[:error] = 'Failed to submit. Please try again.'
    end
  end

  private
    def wantit_params
      params[:wantit][:user_id] = current_user.id
      params.require(:wantit).permit(:user_id, :skin_id)
    end

    def require_login
      filter_require_login
    end

    def my_wantit_exists?
      wantit_hash = {
        skin_id: wantit_params[:skin_id],
        user_id: current_user.id
      }
      Wantit.find_by(wantit_hash)
    end
end
