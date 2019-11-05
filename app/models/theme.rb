class Theme < ApplicationRecord
  has_many :photos

  scope :for_video, -> { where('themes.video = 1') }
  scope :for_photo, -> { where('themes.video = 0') }

  def to_s
    title
  end
end

