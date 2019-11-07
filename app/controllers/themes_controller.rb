class ThemesController < ApplicationController
  before_action :get_theme_and_check_permission, only: [:show, :edit, :update]

  def index
    @themes = Theme.all
    authorize :theme
  end

  def show
    render layout: false if modal_page
  end

  def new
    @theme = Theme.new
    authorize @theme
  end

  def create
    @theme = Theme.new(theme_params)
    authorize @theme
    if @theme.save
      redirect_to themes_path
    else
      redner action: :new
    end
  end

  def edit
  end

  def update
    if @theme.update(theme_params)
      redirect_to themes_path
    else
      render action: :edit
    end
  end

  private

  def theme_params
    params[:theme].permit(:title, :subtitle, :description, :video, :school)
  end

  def get_theme_and_check_permission
    @theme = Theme.find(params[:id])
    authorize @theme
  end
end
