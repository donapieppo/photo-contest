class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @photos = @videos = []
    if current_user
      @photos = current_user.photos
      @videos = current_user.videos
    end
  end
end
