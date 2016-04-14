class ApplicationController < ActionController::Base

  before_action :authenticate_user_from_token!
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render422(messages)
    render json: {errors: messages}, status: :unprocessable_entity
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :email,
      :password,
      :password_confirmation)
    }
  end

  private

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      email = options[:email].presence
      user = email && User.find_by_email(email)
      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end

end
