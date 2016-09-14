class SkinsController < ApplicationController
  def show
    @skin = Skin.find(params[:id])
    @champion = @skin.champion
  end
end
