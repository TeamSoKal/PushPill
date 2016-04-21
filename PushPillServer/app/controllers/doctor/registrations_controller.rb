class Doctor::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  protect_from_forgery with: :null_session
  skip_before_filter :verify_signed_out_doctor

  respond_to :json
  acts_as_token_authentication_handler_for Doctor

  def create
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :name) }
  end
end
