class Game < ApplicationRecord
  has_many :variations
  has_many :characters, :through => :variations 
  validates :name, presence: true
end
