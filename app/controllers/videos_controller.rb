class VideosController < ApplicationController
  before_action :get_video_and_check_permission, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.jury_or_manager?
      if params[:theme_id]
        @theme = Theme.find(params[:theme_id])
        @videos = @theme.videos.order(:user_id)
      elsif params[:user_id]
        @user = User.find(params[:user_id])
        @videos = @user.videos.order(:theme_id)
      else
        @videos = Video.order(:theme_id)
      end
    else
      # should not get here, not linked
      @videos = current_user.videos.order(:theme_id)
    end
    @videos = @videos.includes(:theme, :user)
    authorize @videos
  end

  def show
  end

  def new
    @theme = Theme.find(params[:theme_id]) if params[:theme_id]
    @video = current_user.videos.new
    authorize @video
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @video = current_user.videos.new(video_params)
    @video.theme = @theme
    authorize @video
    if @video.save
      redirect_to root_path, notice: 'Grazie per aver inviato il tuo video. Avrai tempo fino alla chiusura del concorso per modificarla o cancellarla.'
    else
      render action: :new
    end
  end

  def edit
    @theme = @video.theme
  end

  def update
    if @video.update_attributes(video_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to root_path
  end

  private

  def video_params
    params[:video].permit(:description, :video_url)
  end

  def get_video_and_check_permission
    @video = Video.find(params[:id])
    authorize @video
  end

end
