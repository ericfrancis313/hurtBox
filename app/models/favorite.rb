class FavoriteWord < ApplicationRecord

  validates :user_id, presence:true
  validates :vocabulary_id, precence:true

  belongs_to :vocabulary
  belongs_to :user
end
