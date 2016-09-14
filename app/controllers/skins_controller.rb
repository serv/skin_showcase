class SkinsController < ApplicationController
  def show
    @skin = Skin.find(params[:id])
    @champion = @skin.champion
    @review = @skin.reviews.build
    @reviews = @skin.reviews
  end
end
