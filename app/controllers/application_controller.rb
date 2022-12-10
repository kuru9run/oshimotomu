class ApplicationController < ActionController::Base
  before_action :require_login

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: t('defaults.message.unauthorized')
  end

  private
  def not_authenticated
    redirect_to main_app.login_path, alert: t('defaults.message.require_login')
  end
end
