class Skin < ApplicationRecord
  belongs_to :champion
  has_many :reviews

  def loading_img_url
    "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/#{self.champion.name}_#{self.skin_num}.jpg"
  end
end
