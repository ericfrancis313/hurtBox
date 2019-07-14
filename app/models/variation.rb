class Variation < ApplicationRecord
  has_many :moves

  validates :character_id, presence:true
  validates :game_id, presence:true

  belongs_to :game
  belongs_to :character
end
