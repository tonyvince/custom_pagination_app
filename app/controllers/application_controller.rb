require "pagy_cursor/pagy/extras/cursor"
require "pagy_cursor/pagy/extras/uuid_cursor"

class ApplicationController < ActionController::API
  include RackSessionFix
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
