class GridsController < ApplicationController
  def index
  end

  def set_or_update_color
    Grids::SetOrUpdateColor.call(params.merge!(user_id: session[:user]["id"]))
    render json: { msg: 'success' }, status: 200
  rescue Exception => e
    render json: { msg: 'Server Error' }, status: 500
  end
end
