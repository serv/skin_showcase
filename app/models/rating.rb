class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :skin
  belongs_to :review

  validates :skin_id, presence: true
  validates :user_id, presence: true
  validates :score, presence: true

  before_save :associate_review

  private

    # When a rating is saved, check if there is a review to associate with
    def associate_review
      review = Review.find_by(user_id: self.user_id, skin_id: self.skin_id)
      self.review_id = review.id if review
    end
end
