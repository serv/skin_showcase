class Search
  # Do not need a table in the database
  include ActiveModel::Model

  attr_accessor :content

  def self.result_for(query)
    {
      champions: Champion.where('name ~* ?', query),
      skins: Skin.where('name~* ?', query)
    }
  end
end
