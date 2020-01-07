class Theme < ApplicationRecord
  has_many :photos
  has_many :videos

  scope :for_video, -> { where('themes.video = 1') }
  scope :for_photo, -> { where('themes.video = 0') }

  def to_s
    title
  end

  def for_photo?
    ! for_videos?
  end

  def for_video?
    self.video
  end

end

