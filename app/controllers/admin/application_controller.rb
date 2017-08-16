module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :set_locale
    before_action :authenticate_admin_user!


    # before_action :authenticate_admin
    #
    # def authenticate_admin
    #   # TODO Add authentication logic here.
    # end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    private

    def set_locale
      I18n.locale = current_student.try(:locale) || ( params[:locale] || I18n.default_locale )
    end

    def default_url_options
      { locale: I18n.locale }
    end
  end
end
