class Character < ApplicationRecord
  has_many :variations


  has_many :games, :through => :variations
  has_many :moves, :through => :variations
  validates :name, presence:true

end
