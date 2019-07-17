class Move < ApplicationRecord
  validates :variation_id, presence:true
  validates :name, presence:true
  validates :input, presence:true

  belongs_to :variation
end
