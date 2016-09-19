class Review < ApplicationRecord
  belongs_to :skin
  belongs_to :user
  has_many :helpfuls

  validates :skin_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :long_form, presence: true

  def total_helpfuls
    helpfuls
  end

  def total_up_helpfuls
    helpfuls.select { |h| h.upvote == 1 }
  end
end
