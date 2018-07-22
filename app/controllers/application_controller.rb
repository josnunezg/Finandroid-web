class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout "finandroid_app"


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
end
