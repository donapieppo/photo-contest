class ApplicationController < ActionController::Base
  include Pundit

  I18n.locale = :it

  protect_from_forgery
  before_action :authenticate_user!
end
