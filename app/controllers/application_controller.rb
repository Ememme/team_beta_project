class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_student!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Setting language


  private

  def set_locale
    I18n.locale = current_student.try(:locale) || ( params[:locale] || I18n.default_locale )
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio, :id_number, :locale])
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_student_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

end
