class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :skin
  belongs_to :review

  validates :skin_id, presence: true
  validates :user_id, presence: true
  validates :score, presence: true
end
