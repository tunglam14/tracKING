class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_site
  before_action :load_site

  include SeedHelper

  private
    def load_site
      cookies[:current_site_id] = Site.first.id if cookies[:current_site_id].nil?
    end

    def set_site
      unless params[:client_id].nil?
        cookies[:current_site_id] = Site.find_by_client_id(params[:client_id]).id
        redirect_to APP_CONFIG["hostname"] + "/#/dashboard"
      end
    end
end
