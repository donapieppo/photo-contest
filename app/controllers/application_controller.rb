class ApplicationController < ActionController::Base
  include Pundit
  impersonates :user

  I18n.locale = :it

  protect_from_forgery
  before_action :authenticate_user!, :log_current_user, :user_complete_data

  def user_complete_data
    if current_user && ! current_user.data_complete? 
      redirect_to(edit_user_info_path, alert: "Vi preghiamo di completare l'inserimento dei vostri dati. #{current_user.id_card_missing_error}")
    end
  end

  # copy in app/controllers/application_controller.rb
  def modal_page
    params[:modal] && params[:modal] == 'yyy'
  end

  def log_current_user
    current_user or return true
    if current_user != true_user
      logger.info("#{true_user.email} IMPERSONATING #{current_user.email}")
    else
      logger.info("Current user: #{current_user.id} #{current_user.email}")
    end
  end

end
