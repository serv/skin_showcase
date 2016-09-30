class Review < ApplicationRecord
  belongs_to :skin
  belongs_to :user
  has_many :helpfuls
  has_one :rating

  validates :skin_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :long_form, presence: true

  after_save :associate_rating

  def total_helpfuls
    helpfuls
  end

  def total_up_helpfuls
    helpfuls.select { |h| h.upvote == 1 }
  end

  private

    # When a review is saved, check if there is a rating to associate with
    def associate_rating
      rating = Rating.find_by(user_id: self.user_id, skin_id: self.skin_id)
      puts self.inspect
      rating.update_attribute('review_id', self.id) if rating
    end
end
