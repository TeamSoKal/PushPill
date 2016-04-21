class Api::PillsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    @pill = Pill.find_by_id(params[:id])
  end

  def new
    @pill = Pill.new
  end

  def create
    @pill = Pill.new(pill_params)

    if @pill.save
      render json: { success: true }
    end
  end

  def edit
    @pill = Pill.find_by_id(params[:id])
  end

  def update
    @pill = Pill.find_by_id(params[:id])

    if @pill.update(pill_params)
      render json: { success: true }
    end
  end

  def complete
    render 'api/pills/complete.html.erb'
  end

  def destroy
    @pill = Pill.find_by_id(params[:id])
    @pill.destroy
    render json: { success: true }
  end

  def check
    @pill = Pill.find_by_id(params[:id])
    @pill.checked = true
    @pill.save!
    render json: { success: true }
  end

  private

  def set_pill
    @pill = Pill.find_by_id(params[:id])
  end

  def pill_params
    params.require(:pill).permit(:name, :number, :days_of_week, :notes, :image_path, :time, :user_id)
  end
end