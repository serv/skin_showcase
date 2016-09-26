class OwnitsController < ApplicationController
  before_action :require_login

  def create
    return if my_ownit_exists?

    @ownit = Ownit.new(ownit_params)
    @ownit.user_id = current_user.id

    if @ownit.save
      render json: @ownit
    else
      flash.now[:error] = 'Failed to submit. Please try again.'
    end
  end

  private
    def ownit_params
      params[:ownit][:user_id] = current_user.id
      params.require(:ownit).permit(:user_id, :skin_id)
    end

    def require_login
      filter_require_login
    end

    def my_ownit_exists?
      ownit_hash = {
        skin_id: ownit_params[:skin_id],
        user_id: current_user.id
      }
      Ownit.find_by(ownit_hash)
    end
end
