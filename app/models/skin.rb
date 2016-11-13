class Skin < ApplicationRecord
  belongs_to :champion
  has_many :reviews
  has_many :ratings

  def loading_img_url
    "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/#{self.champion.original_id}_#{self.skin_num}.jpg"
  end

  def default?
    name == 'default'
  end
end
