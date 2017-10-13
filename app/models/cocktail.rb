class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
