class Champion < ApplicationRecord
  has_many :skins

  def tile_img_url
    "http://ddragon.leagueoflegends.com/cdn/6.18.1/img/champion/#{self.name}.png"
  end
end
