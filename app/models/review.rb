class Review < ApplicationRecord
  belongs_to :skin
  belongs_to :user

  validates :skin_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :long_form, presence: true
end
