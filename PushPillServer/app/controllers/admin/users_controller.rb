class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find_by_id(params[:id])
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
end