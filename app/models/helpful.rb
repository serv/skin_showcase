class Helpful < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :review_id, presence: true
  validates :user_id, presence: true
  validates :upvote, presence: true
end
