class Api::PatientsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_doctor

  def index
    @patients = @doctor.users
  end

  def show
    @patient = @doctor.users.where('id = ?', params[:id]).first
  end

  def create
    @patient = User.find_by_id(params[:user_id])
    logger.debug @doctor
    @patient.doctor_id = @doctor.id
    @patient.save!
    render json: { success: true }
  end

  def destroy
    @patient = User.find_by_id(params[:id])
    @patient.doctor_id = nil
    @patient.save!
    render json: { success: true }
  end

  def alert
    @users = User.all.where('checked = ?', false)
  end

  def push
    @user = User.find_by_id(params[:id])
    unless @user.device_token
      render json: {}
      return
    end
    n = Rpush::Apns::Notification.new
    n.app = Rpush::Apns::App.find_by_name("ios_app")
    n.device_token = @user.device_token
    n.alert = params[:message]
    n.save!
    render json: {}
  end

  private

  def set_doctor
    @doctor = Doctor.find_by_authentication_token(params[:token])
  end
end