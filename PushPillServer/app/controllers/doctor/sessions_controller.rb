class Doctor::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  skip_before_filter :verify_signed_out_doctor

  respond_to :json
  acts_as_token_authentication_handler_for Doctor

  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    sign_in(resource_name, resource)
    return render json: { success: true, token: resource.authentication_token }
  end

  def failure
    return render json: { success: false, errors: ['Login information is incorrect, please try again'] }
  end

  def destroy
    doctor = Doctor.find_by_authentication_token(params[:auth_token])
    if doctor
      doctor.authentication_token = nil
      doctor.save!
      render :status => 200,
             :json => { :success => true }
    else
      render :status => 401,
             :json => { :success => false }
    end
  end
end
