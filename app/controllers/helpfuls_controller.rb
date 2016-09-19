class HelpfulsController < ApplicationController
  before_action :require_login

  def create
    return if my_helpful_exists?

    @helpful = Helpful.new(helpful_params)
    @helpful.user_id = current_user.id

    if @helpful.save
      render json: @helpful
    else
      flash.now[:error] = 'Failed to submit. Please try again.'
    end
  end

  private

    def helpful_params
      params[:helpful][:upvote] = params[:helpful][:upvote].to_i
      params.require(:helpful).permit(:review_id, :upvote, :user_id)
    end

    def require_login
      filter_require_login
    end

    def my_helpful_exists?
      helpful_hash = {
        review_id: helpful_params[:review_id],
        user_id: current_user.id
      }
      Helpful.find_by(helpful_hash)
    end
end
