class Video < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  YOUTUBE_REGEX = %r{https://www\.youtube\.com/watch\?v=(?<video_code>[0-9a-zA-Z]+)}
  VIMEO_REGEX   = %r{https://vimeo\.com/(?<video_code>[0-9a-zA-Z]+)}

  def embed_url
    if m = video_url.match(YOUTUBE_REGEX)
      return "https://www.youtube.com/embed/#{m[:video_code]}"
    elsif m = video_url.match(VIMEO_REGEX)
      return "https://player.vimeo.com/video/#{m[:video_code]}"
    end
  end
end
