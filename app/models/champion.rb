class Champion < ApplicationRecord
  def tile_img_url
    "http://ddragon.leagueoflegends.com/cdn/6.18.1/img/champion/#{self.name}.png"
  end
end
