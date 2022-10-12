# frozen_string_literal: true

# RegistrationController
class RegistrationController < Devise::RegistrationController
  before_action :sign_up_params, if: :devise_controller?

  private

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def acount_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
  end
end
