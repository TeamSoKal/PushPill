class Api::UserController < ApplicationController
  def patients
    @users = User.where('doctor_id IS NULL')
  end

  def show
    @user = User.find_by_authentication_token(params[:token])
  end
end
