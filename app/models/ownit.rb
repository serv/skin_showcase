class Ownit < ApplicationRecord
  belongs_to :user
  belongs_to :skin

  validates :skin_id, presence: true
  validates :user_id, presence: true
end
