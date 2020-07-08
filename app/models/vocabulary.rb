class Vocabulary < ApplicationRecord
  validates :word, presence:true
  validates :definition, presence:true

  has_many :users, :through => :favorites
end
