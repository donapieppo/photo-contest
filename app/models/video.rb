class Video < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  def embed_url
    if video_url =~ /https:\/\/www\.youtube\.com\/watch\?v=([0-9a-zA-Z]+)/
      return "https://www.youtube.com/embed/#{$1}"
    end
  end
end
