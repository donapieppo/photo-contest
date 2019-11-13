class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :theme

  validates :description, presence: true 
end
