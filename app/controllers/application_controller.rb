class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout :layout_by_resource


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
