class RatingsController < ApplicationController
  before_action :require_login

  def create
    existing_rating = Rating.find_by({ skin_id: ratings_params[:skin_id] })
    return update_existing(existing_rating) if existing_rating

    @rating = Rating.new(ratings_params)
    @rating.user_id = current_user.id

    if @rating.save
      # redirect_to skin_url(@review.skin)
      render json: @rating
    else
      flash.now[:error] = 'Failed to rate. Please try again.'
      # render 'skins/show'
    end
  end

  private

    def ratings_params
      params.require(:rating).permit(:score, :skin_id, :review_id)
    end

    def require_login
      filter_require_login
    end

    def update_existing(existing_rating)
      if existing_rating.update_attributes(ratings_params)
        render json: @rating
      else
        flash.now[:error] = 'Failed to rate. Please try again.'
      end
    end
end
