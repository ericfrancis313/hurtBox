class User < ApplicationRecord
  has_many :favorites

  has_many :vocabulary, :through => :favorites

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
