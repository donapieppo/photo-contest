class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @photos = []
    if current_user
      @photos = current_user.photos
    end
  end
end
