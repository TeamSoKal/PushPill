class Api::DoctorController < ApplicationController
  before_action :set_doctor

  private

  def set_doctor
    @doctor = Doctor.find_by_authentication_token(params[:token])
  end
end