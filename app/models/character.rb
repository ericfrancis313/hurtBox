class Character < ApplicationRecord
  has_many :variations
  has_many :games, :through => :varia
  validates :name, presence:true

end
