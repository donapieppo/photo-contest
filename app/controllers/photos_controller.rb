class PhotosController < ApplicationController
  before_action :get_photo_and_check_permission, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.jury_or_manager?
      if params[:theme_id]
        @theme = Theme.find(params[:theme_id])
        @photos = @theme.photos
      elsif params[:user_id]
        @user = User.find(params[:user_id])
        @photos = @user.photos
      else
        @photos = Photo.order(:theme_id)
      end
    else
      # should not get here, not linked
      @photos = current_user.photos.order(:theme_id)
    end
    @photos = @photos.includes(:theme, :user).with_attached_image
    authorize @photos
  end

  def show
  end

  def new
    @theme = Theme.find(params[:theme_id]) if params[:theme_id]
    @photo = current_user.photos.new
    authorize @photo
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @photo = current_user.photos.new(photo_params)
    @photo.theme = @theme
    authorize @photo
    if @photo.save
      redirect_to root_path, notice: 'Grazie per aver inviato la tua foto. Avrai tempo fino alla chiusura del concorso per modificarla o cancellarla.'
    else
      render action: :new
    end
  end

  def edit
    @theme = @photo.theme
  end

  def update
    @theme = @photo.theme
    if @photo.update_attributes(photo_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path
  end

  private

  def photo_params
    params[:photo].permit(:description, :image)
  end

  def get_photo_and_check_permission
    @photo = Photo.find(params[:id])
    authorize @photo
  end

end
