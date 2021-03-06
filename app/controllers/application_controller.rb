class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = params[:locale] || I18n.default_locale
  end
#
# private
#   def admin_user
#     redirect_to(root_url) unless current_user.admin?
#   end

end
