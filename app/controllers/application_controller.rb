class ApplicationController < ActionController::Base
  include Pundit
  impersonates :user

  I18n.locale = :it

  protect_from_forgery
  before_action :authenticate_user!, :user_complete_data

  def user_complete_data
    if current_user
      current_user.data_complete? or redirect_to(edit_user_info_path, alert: "Si prega di completare l'inserimento dei propri dati.")
    end
  end

  # copy in app/controllers/application_controller.rb
  def modal_page
    params[:modal] && params[:modal] == 'yyy'
  end
end
