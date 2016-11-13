class Champion < ApplicationRecord
  has_many :skins

  def to_param
    url_id
  end

  def tile_img_url
    "http://ddragon.leagueoflegends.com/cdn/6.18.1/img/champion/#{self.original_id}.png"
  end
end
