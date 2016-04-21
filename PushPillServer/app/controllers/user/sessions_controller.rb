class User::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  skip_before_filter :verify_signed_out_user
  before_action :configure_permitted_parameters

  respond_to :json
  acts_as_token_authentication_handler_for User

  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    sign_in(resource_name, resource)
    return render json: { success: true, token: resource.authentication_token }
  end

  def failure
    return render json: { success: false, errors: ['Login information is incorrect, please try again'] }
  end

  def destroy
    user = User.find_by_authentication_token(params[:auth_token])
    if user
      user.authentication_token = nil
      user.save!
      render :status => 200,
             :json => { :success => true }
    else
      render :status => 401,
             :json => { :success => false }
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :device_token) }
  end
end
