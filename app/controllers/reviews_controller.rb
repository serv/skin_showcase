class ReviewsController < ApplicationController
  before_action :require_login

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes!(review_params)
      redirect_to skin_url(@review.skin)
    else
      flash.now[:error] = 'Failed to update review. Please try again.'
      render 'edit'
    end
  end

  def create
    return if my_review_exists?
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to skin_url(@review.skin)
    else
      flash.now[:error] = 'Failed to create review. Please try again.'
      render 'skins/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
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

    def my_review_exists?
      Review.find_by({ skin_id: review_params[:skin_id], user_id: current_user.id })
    end
end
