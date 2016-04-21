class Admin::Manager::SessionsController < Devise::SessionsController
  layout 'admin'
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end

  private

  def after_sign_in_path_for(resource)
    return session[:oauth_login_redirect_path] unless session[:oauth_login_redirect_path].nil?
    stored_location_for(resource) || admin_root_url
  end

  def respond_to_on_destroy
    redirect_to new_manager_session_path
  end
end
