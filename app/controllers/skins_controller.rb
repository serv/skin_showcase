class SkinsController < ApplicationController
  def show
    @skin = Skin.find(params[:id])
    @champion = @skin.champion
    @reviews = @skin.reviews
    @global = {
      skinId: @skin.id
    }

    if current_user
      existing_review = current_user.review_for(@skin)
      @review = existing_review ? existing_review : @skin.reviews.build
      @rating = current_user.rating_for(@skin)
      @global[:rating] = @rating if @rating
    end
  end
end
