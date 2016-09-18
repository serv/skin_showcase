class SkinsController < ApplicationController
  def show
    @skin = Skin.find(params[:id])
    @champion = @skin.champion
    @reviews = @skin.reviews
    @global = {
      skinId: @skin.id
    }

    existing_review = nil
    if current_user
      existing_review = current_user.review_for(@skin)
      @rating = current_user.rating_for(@skin)
      @global[:rating] = @rating if @rating
    end

    @review = existing_review ? existing_review : @skin.reviews.build
  end
end
