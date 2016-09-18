class SkinsController < ApplicationController
  def show
    @skin = Skin.find(params[:id])
    @champion = @skin.champion
    @review = @skin.reviews.build
    @reviews = @skin.reviews
    @rating = current_user.ratings_for(@skin) if current_user
    @global = {
      skinId: @skin.id
    }
    @global[:rating] = @rating if @rating
  end
end
