# frozen_string_literal: true

# ApplicationController Controller
class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username email password password_confirmation])
  end
end
