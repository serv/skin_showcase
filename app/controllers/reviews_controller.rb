class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to skin_url(@review.skin)
    else
      flash.now[:error] = 'Failed to create review. Please try again.'
      render 'skins/show'
    end
  end

  private
    def review_params
      params.require(:review).permit(:skin_id,
                                     :title,
                                     :long_form,
                                     :user_id)
    end

    def require_login
      filter_require_login
    end
end
