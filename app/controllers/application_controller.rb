class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
 
  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale 
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "You don't have access to that feature. Please try again."
  end
end
