# frozen_string_literal: true

class RegistrationController < Devise::RegistrationController
  
  private 

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
